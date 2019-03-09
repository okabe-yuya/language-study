import keras
from keras.datasets import mnist
from keras.layers import Layer, Conv2D, MaxPool2D, Flatten, Dense, Input, Activation
from keras.initializers import Ones, Zeros
import keras.backend as K
import numpy as np

def cnn_layer_block(inputs, length, dropout_rate=0.5):
    cnn = Conv1D(filters=256, kernel_size=length, strides=1, activation="relu")(inputs)
    layer_normalization = LayerNormalization()(cnn)
    sum_pooling = (layer_normalization)
    dropout = Dropout(dropout_rate)
    return dropout

def fc_layer_block(inputs, dropout_rate=0.5):
    fc = Dense(1024, input_shape=(2, ))(inputs)
    fc_layer_normalization = LayerNormalization()(fc)
    dropout = Dropout(dropout_rate)
    return dropout

class LayerNormalization(Layer):
    def __init__(self, eps=1e-6, **kwargs):
        self.eps = eps
        super(LayerNormalization, self).__init__(**kwargs)
    def build(self, input_shape):
        self.gamma = self.add_weight(name='gamma', shape=input_shape[-1:],
                                      initializer=Ones(), trainable=True)
        self.beta = self.add_weight(name='beta', shape=input_shape[-1:],
                                    initializer=Zeros(), trainable=True)
        super(LayerNormalization, self).build(input_shape)
    def call(self, x):
        mean = K.mean(x, axis=-1, keepdims=True)
        std = K.std(x, axis=-1, keepdims=True)
        return self.gamma * (x - mean) / (std + self.eps) + self.beta
    def compute_output_shape(self, input_shape):
        return input_shape

def main():
    text_input = Input(shape=(200, 32))
    assert text_input.shape[0] == 200
    assert text_input.shape[1] == 32
    char_emb = Embedding(input_dim=32, output_dim=4)(text_input)
    assert char_emb.shape[0] == 200
    assert char_emb.shape[1] == 4
    cnn1 = cnn_layer_block(char_emb, 2)
    # assert cnn1.shape[0] == 
    cnn2 = cnn_layer_block(char_emb, 3)
    cnn3 = cnn_layer_block(char_emb, 4)
    cnn4 = cnn_layer_block(char_emb, 5)
    activate_relu = Activation('relu')(cnn)
    layer_normalization = LayerNormalization()(activate_relu)
    sum_pooling = (layer_normalization)
    dropout = Dropout(0.5)(sum_pooling)
    concat = Concatenate(axis=-1)([cnn1, cnn2, cnn3, cnn4])
    average = Average()(concat)
    total_layer_normalization = LayerNormalization()(average)
    fc1 = fc_layer_block()(total_layer_normalization)
    fc2 = fc_layer_block()(fc1)
    fc3 = fc_layer_block()(fc2)
    classfication = Dense(1, shape=(2, ))
    output = Activation('sigmoid')(classfication)
    model = Model(inputs=text_input, outputs=output)
    model.compile(
            optimizer='Adam',
            loss='binary_crossentropy',
            metrics=['accuracy'],
          )
    model.fit(data, label)

if __name__=="__main__":
    main()