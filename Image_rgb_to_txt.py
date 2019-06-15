"""
Extract RGB values from image and save pixel values in .txt ascii file
Project Group ID: 8
Member name: Pratikkumar Prajapati (012541477)
Member name: Siddharth Chawla(012451855)
For CMPE214 (Spring 2019), under guidance of Dr. Hyeran Jeon <hyeran.jeon@sjsu.edu>
"""

import sys
import os
from PIL import Image

size = 227, 227

if len(sys.argv) != 2:
    print("%s <input_image_file>" % sys.argv[0])
    exit(-1)

# Get image name from arg
image_file = sys.argv[1]
image_file_name = os.path.splitext(image_file)[0]
im = Image.open(image_file)  # Can be many different formats.
im = im.resize(size)
# save resized image
im.save(image_file_name + '_227x227.jpg', 'JPEG')
# get RGB values
pixel_values = im.getdata()
# Flatten the pixels
pix_val_flat = [x for sets in pixel_values for x in sets]
txt_path = image_file_name + '.txt'
# save the pixel values in RGB
with open(txt_path, 'w') as f:
    for item in pix_val_flat:
        f.write("%s\n" % item)
