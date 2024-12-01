from PIL import Image

# Open the uploaded image
image_path = '/path/to/Downloads/image.png'
image = Image.open(image_path)

# Define the new color for recoloring
new_color = (183, 248, 240)  # RGB equivalent of #b7f8f0

# Convert the image to RGBA mode
image = image.convert("RGBA")

# Replace all pixels with the new color while keeping the alpha channel intact
data = image.getdata()
new_image_data = [
    new_color + (pixel[3],) if pixel[:3] != (0, 0, 0, 0) else pixel
    for pixel in data
]
image.putdata(new_image_data)

# Save the modified image
output_path = "/path/to/repainted_image.png"
image.save(output_path)

output_path