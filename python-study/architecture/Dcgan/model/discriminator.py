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

def discriminator():
    def d_cnn_layer(inputs, filter_size, kernel_size, stride_size, hyper_params=[0.2, 0.8, 0.25]):
        cnn = Conv2D(filters=filter_size, kernel_size=kernel_size, strides=stride_size)(inputs)
        activate_func = LeakyReLU(alpha=hyper_params[0])(cnn)
        dropout = Dropout(hyper_params[1])(activate_func)
        batch_norm = BatchNormalization(momentum=hyper_params[2])(dropout)

        return batch_norm
    input_layer = Input(shape=(32, 32, 64))
    cnn1 = d_cnn_layer(input_layer, 128, 2, 2)
    cnn2 = d_cnn_layer(cnn1, 256, 2, 2)
    cnn3 = d_cnn_layer(cnn2, 512, 2, 2)
    classfication = Dense(512, activation='sigmoid')(cnn3)
    model = Model(inputs=input_layer, outputs=classfication)
    model.compile(
        optimizer='Adam',
        loss='binary_crossentropy',
        metrics=['accuracy'],
    )
    model.summary()
    return model