import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
from keras.preprocessing import image

path = 'E:\\FINAL\\DO-AN-NAY-BI-QUY-AM\\backend\\train\\test_img\\cam2.jpg'
img=tf.keras.preprocessing.image.load_img(path, target_size=(180, 180))

classes_name = ['Alpinia officinarum', 'Ananas comosus', 'Apple', 'Apple leaf', 'Asteraceae', 'Banana', 'Blueberry leaf', 'Brassicaceae1', 'Brassicaceae2', 'Cabbage soup', 'Camellia sinensis', 'Cherry', 'Cherry leaf', 'Chickoo fruit', 'Coffea arabica', 'Daisy', 'Dandelion', 'Daucus carota subsp', 'Grape leaf', 'Grapes fruit', 'Hydrangea', 'Iridaceae', 'Kiwi fruit', 'Lavandula angustifolia', 'Lily', 'Mango fruit', 'Narcissus tazetta L', 'Orange fruit', 'Peach leaf', 'Pepper leaf', 'Perilla frutescens', 'Piper sarmentosum', 'Potato', 'Potato leaf', 'Raspberry leaf', 'Rose', 'Shiitake mushroom', 'Solanum lycopersicum', 'Soybean leaf', 'Strawberry fruit', 'Strawberry leaf', 'Sunflower', 'Tithonia diversifolia', 'Tomato leaf', 'Tulip']

x= tf.keras.preprocessing.image.img_to_array(img)
test_img = np.expand_dims(x, axis=0)

model = tf.keras.models.load_model('agriculture_model.h5')
prediction = model.predict(test_img)
pred = np.argmax(prediction)

print(classes_name[pred])

plt.figure(figsize=(5,5))
plt.imshow(img)
plt.xlabel(classes_name[pred])
plt.xticks([])
plt.show()

