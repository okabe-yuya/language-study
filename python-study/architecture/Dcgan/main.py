from model.discriminator import discriminator
from model.generater import generator
from keras.models import Model
from keras.utils import plot_model

def main():
  print("start make summary and model image")
  Generator = generator()
  Discriminator = discriminator()
  model_list = [Generator, Discriminator]
  for i, model in enumerate(model_list):
    print("-->model summary...")
    model.summary()
    plot_model(model, to_file='model_{}.png'.format(i), show_shapes=True)
    print("-->make model image as model_{}.png".format(i))
  print("all finished!!")

if __name__ == "__main__":
  main()