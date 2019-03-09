from keras.models import Model
from keras.utils import plot_model
from keras.layers import (
    Conv1D,
    Dense,
    Input,
    Embedding,
    Dropout,
    concatenate,
    BatchNormalization,
    Lambda,
)
import keras.backend as K
import numpy as np


def cnn_layer_block(inputs, length, dropout_rate=0.5):
    cnn = Conv1D(filters=256, kernel_size=length, strides=1, activation="relu")(inputs)
    assert cnn.shape[1] == inputs.shape[1] - length + 1
    assert cnn.shape[2] == 256
    layer_normalization = BatchNormalization()(cnn)

    def sum_pooling(inputs):
        return K.sum(inputs, axis=1)

    sum_l = Lambda(sum_pooling)(cnn)
    dropout = Dropout(dropout_rate)(sum_l)
    return dropout

def fc_layer_block(inputs, dropout_rate=0.5):
    fc = Dense(1024, input_shape=(2, ), activation='relu')(inputs)
    fc_layer_normalization = BatchNormalization()(fc)
    dropout = Dropout(dropout_rate)(fc_layer_normalization)
    return dropout

def main():
    text_input = Input(shape=(200,))
    assert text_input.shape[1] == 200, f"text_input shape: {text_input.shape}"
    # assert text_input.shape[2] == 32, f"text_input shape: {text_input.shape}"
    char_emb = Embedding(input_dim=200, output_dim=32)(text_input)
    assert char_emb.shape[1] == 200
    assert char_emb.shape[2] == 32, f"char_emb: {char_emb.shape}"
    cnn1 = cnn_layer_block(char_emb, 2)
    assert cnn1.shape[1] == 256
    cnn2 = cnn_layer_block(char_emb, 3)
    cnn3 = cnn_layer_block(char_emb, 4)
    cnn4 = cnn_layer_block(char_emb, 5)
    concate_cnn = concatenate([cnn1, cnn2, cnn3, cnn4], axis=-1)
    layer_normalization = BatchNormalization()(concate_cnn)
    assert layer_normalization.shape[1] == 1024
    fc1 = fc_layer_block(layer_normalization)
    assert fc1.shape[1] == 1024
    fc2 = fc_layer_block(fc1)
    fc3 = fc_layer_block(fc2)
    classfication = Dense(5, input_shape=(2, ), activation='sigmoid')(fc3)
    model = Model(inputs=text_input, outputs=classfication)
    model.compile(
            optimizer='Adam',
            loss='binary_crossentropy',
            metrics=['accuracy'],
          )
    # model.fit(data, label)
    model.summary()
    plot_model(model, to_file='model.png', show_shapes=True)

if __name__=="__main__":
    main()