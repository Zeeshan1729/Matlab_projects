import cv2
import numpy as np

# Create white image
img = np.ones((128, 128, 3), dtype=np.uint8) * 255

# =========================
# FRONT FACE
# =========================

front = np.array([
    [20, 40],
    [60, 40],
    [60, 90],
    [20, 90]
], np.int32)

# =========================
# BACK FACE
# =========================

back = np.array([
    [40, 20],
    [80, 20],
    [80, 70],
    [40, 70]
], np.int32)

# Draw faces
cv2.polylines(img, [front], True, (0,0,0), 1)
cv2.polylines(img, [back], True, (0,0,0), 1)

# Connect corners
for i in range(4):
    cv2.line(
        img,
        tuple(front[i]),
        tuple(back[i]),
        (0,0,0),
        1
    )

# =========================
# GT CORNERS
# STORED AS [y x]
# =========================

gt = np.array([

    [40,20],
    [40,60],
    [90,60],
    [90,20],

    [20,40],
    [20,80],
    [70,80],
    [70,40]

])

# Save image
cv2.imwrite("cuboid_128.png", img)

# Save GT
np.savetxt("cuboid_128_gt.txt", gt, fmt='%d')

print("Saved cuboid image and GT.")