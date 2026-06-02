import cv2
import numpy as np

# Image size
size = 128

# Create black image
img = np.zeros((size, size), dtype=np.uint8)

# Dodecagon parameters
center = (64, 64)
radius = 40
num_sides = 12

# Generate vertices
points = []

for i in range(num_sides):

    angle = 2 * np.pi * i / num_sides

    x = int(center[0] + radius * np.cos(angle))
    y = int(center[1] + radius * np.sin(angle))

    points.append([x, y])

# Convert to numpy array
points_np = np.array(points, np.int32)

# Draw dodecagon
cv2.polylines(
    img,
    [points_np],
    isClosed=True,
    color=255,
    thickness=1
)

# Save image
cv2.imwrite("dodecagon_128.png", img)

# Save GT file
with open("dodecagon_gt.txt", "w") as f:

    for p in points:

        x = p[0]
        y = p[1]

        f.write(f"{x} {y}\n")

print("Dodecagon image and GT file created.")