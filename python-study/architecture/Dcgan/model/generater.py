from keras.models import Model
from keras.layers import (
    Conv2D,
    Dense,
    Input,
    Reshape,
    BatchNormalization,
    UpSampling2D,
    LeakyReLU,
    Dropout
)
import keras.backend as K
import numpy as np
import sys
sys.path.append("..")
from Dcgan.shape_checker import shape_checker

def generator():
    noise_shape = [None, None, 100]
    input_layer = Input(shape=(noise_shape[0], noise_shape[1], noise_shape[2]))

    def g_cnn_layer(inputs, filter_size, kernel_size, strides_size=2, moment_rate=0.8):
        cnn = Conv2D(filters=filter_size, kernel_size=kernel_size, strides=strides_size, activation='relu')(inputs)
        batch_norm = BatchNormalization(momentum=moment_rate)(cnn)
        up_sampling = UpSampling2D()(batch_norm)
        return up_sampling

    dense_layer = Dense(1024, input_dim=100)(input_layer)
    batch_normalization = BatchNormalization()(dense_layer)
    cnn1 = g_cnn_layer(batch_normalization, 512, 8)
    cnn2 = g_cnn_layer(cnn1, 256, 16)
    cnn3 = g_cnn_layer(cnn2, 128, 32)
    assert cnn3.shape[3] == 128
    cnn4 = Conv2D(filters=3, kernel_size=3, strides=2, activation='tanh')(cnn3)
    assert cnn4.shape[3] == 3

    model = Model(inputs=input_layer, outputs=cnn4)
    model.compile(
        optimizer='Adam',
        loss='binary_crossentropy',
        metrics=['accuracy'],
    )
    model.summary()
    return model
