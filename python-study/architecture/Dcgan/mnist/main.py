import os
import pandas as pd
import numpy as np
from matplotlib import pyplot
import keras.backend as K
from keras.layers import (
  Flatten, Dropout, LeakyReLU, Input, Activation, Dense, BatchNormalization
)
from keras.layers.convolutional import UpSampling2D, Conv2D
from keras.models import Model
from keras.optimizers import Adam
from keras.callbacks import TensorBoard
from keras.datasets import mnist

from keras_adversarial.image_grid_callback import ImageGridCallback
from keras_adversarial import AdversarialModel, simple_gan, gan_targets
from keras_adversarial import AdversarialOptimizerSimultaneous, normal_latent_sampling
from image_utils import (
  dim_ordering_fix, dim_ordering_input, dim_ordering_reshape, dim_ordering_unfix
)

def gan_targets(n):
  common_shape = (n, 1)
  generator_fake = np.ones(common_shape)
  generator_real = np.zeros(common_shape)
  discriminator_fake = np.zeros(common_shape)
  discriminator_real = np.ones(common_shape)
  return [
    generator_fake,
    generator_real,
    discriminator_fake,
    discriminator_real
  ]

def model_generator():
  ch_num = 256
  g_input = Input(shape=[100])
  H = Dense(ch_num * 14 * 14)(g_input)
  H = BatchNormalization()(H)
  H = Activation('relu')(H)
  H = dim_ordering_reshape(ch_num, 14)(H)
  H = UpSampling2D(size=(2, 2))(H)
  H = Conv2D(int(ch_num / 2), (3, 3), padding='same')(H)
  H = BatchNormalization()(H)
  H = Activation('relu')(H)
  H = Conv2D(int(ch_num / 4), (3, 3), padding='same')(H)
  H = BatchNormalization()(H)
  H = Activation('relu')(H)
  H = Conv2D(1, (1, 1), padding='same')(H)
  g_V = Activation('sigmoid')(H)
  return Model(g_input, g_V)

def model_discriminator(input_shape=(1, 28, 28), dropout_rate=0.5):
  ch_num = 512
  d_input = dim_ordering_input(input_shape, name='input_x')
  H = Conv2D(int(ch_num / 2), (5, 5), strides=(2, 2), padding='same', activation='relu')(d_input)
  H = LeakyReLU(0.2)(H)
  H = Dropout(dropout_rate)(H)
  H = Conv2D(ch_num, (5, 5), strides=(2, 2), padding='same', activation='relu')(H)
  H = LeakyReLU(0.2)(H)
  H = Dropout(dropout_rate)(H)
  H = Flatten()(H)
  H = Dense(int(ch_num / 2))(H)
  H = LeakyReLU(0.2)(H)
  d_V = Dense(1, activation='sigmoid')(H)
  return Model(d_input, d_V)

def mnist_process(x):
  x = x.astype(np.float32) / 255.0
  return x

def mnist_data():
  (xtrain, ytrain), (xtest, ytest) = mnist.load_data()
  # mnist_process = lambda x: x.astype(np.float32) / 255.0
  return mnist_process(xtrain), mnist_process(xtest)

def generator_sampler(latent_dim, generator):
    def fun():
        zsamples = np.random.normal(size=(10 * 10, latent_dim))
        gen = dim_ordering_unfix(generator.predict(zsamples))
        return gen.reshape((10, 10, 28, 28))

    return fun

if __name__ == "__main__":
  latent_dim = 100
  input_shape = (1, 28, 28)
  generator = model_generator()
  discriminator = model_discriminator(input_shape=input_shape)
  gan = simple_gan(
    generator,
    discriminator,
    normal_latent_sampling((latent_dim,))
  )
  generator.summary()
  discriminator.summary()
  gan.summary()

  model = AdversarialModel(
    base_model=gan,
    player_params=[generator.trainable_weights, discriminator.trainable_weights],
    player_names=["generator", "discriminator"]
  )
  model.adversarial_compile(
    adversarial_optimizer=AdversarialOptimizerSimultaneous(),
    player_optimizers=[
      Adam(1e-4, decay=1e-4),
      Adam(1e-3, decay=1e-4)],
    loss="binary_crossentropy"
    )

  generator_cb = ImageGridCallback(
    "output/gan_convolutional/epoch-{:03d}.png",
    generator_sampler(latent_dim, generator)
  )
  callbacks = [generator_cb]
  if K.backend() == "tensorflow":
      callbacks.append(
        TensorBoard(
          log_dir=os.path.join("output/gan_convolutional/", "logs/"),
          histogram_freq=0, write_graph=True, write_images=True
        )
      )

  xtrain, xtest = mnist_data()
  xtrain = dim_ordering_fix(xtrain.reshape((-1, 1, 28, 28)))
  xtest = dim_ordering_fix(xtest.reshape((-1, 1, 28, 28)))
  y = gan_targets(xtrain.shape[0])
  ytest = gan_targets(xtest.shape[0])
  history = model.fit(
    x=xtrain,
    y=y,
    validation_data=(xtest, ytest),
    callbacks=[generator_cb], epochs=100,
    batch_size=32
  )
  df = pd.DataFrame(history.history)
  df.to_csv("output/gan_convolutional/history.csv")

  generator.save("output/gan_convolutional/generator.h5")
  discriminator.save("output/gan_convolutional/discriminator.h5")