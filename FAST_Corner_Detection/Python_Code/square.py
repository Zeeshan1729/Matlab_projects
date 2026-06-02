import cv2
import numpy as np

# ======================================
# Create Blank Image
# ======================================

img = np.ones((128, 128), dtype=np.uint8) * 255

# ======================================
# Draw Square
# ======================================

top_left = (32, 32)
bottom_right = (96, 96)

cv2.rectangle(
    img,
    top_left,
    bottom_right,
    0,          # black color
    1           # thickness
)

# ======================================
# GT CORNERS
# STORED AS [y x]
# ======================================

gt = np.array([

    [32, 32],   # top-left
    [32, 96],   # top-right
    [96, 96],   # bottom-right
    [96, 32]    # bottom-left

])

# ======================================
# Save Files
# ======================================

cv2.imwrite("square_128.png", img)

np.savetxt(
    "square_128_gt.txt",
    gt,
    fmt='%d'
)

print("Square image and GT saved.")