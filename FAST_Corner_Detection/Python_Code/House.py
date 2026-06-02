from PIL import Image, ImageDraw

# =========================
# IMAGE SIZE
# =========================

SIZE = 128

# Create black image
img = Image.new("L", (SIZE, SIZE), 0)

draw = ImageDraw.Draw(img)

# =========================
# HOUSE COORDINATES
# =========================

# Roof
roof = [
    (24, 55),
    (64, 25),
    (104, 55)
]

# Main body
body = [
    (34, 55),
    (34, 104),
    (94, 104),
    (94, 55)
]

# Door
door_top_left = (54, 74)
door_bottom_right = (74, 104)

# =========================
# DRAW HOUSE
# =========================

# Roof
draw.line([roof[0], roof[1]], fill=255, width=1)
draw.line([roof[1], roof[2]], fill=255, width=1)

# Roof base
draw.line([roof[0], roof[2]], fill=255, width=1)

# House body
draw.rectangle(
    [body[0], body[2]],
    outline=255,
    width=1
)

# Door
draw.rectangle(
    [door_top_left, door_bottom_right],
    outline=255,
    width=1
)

# =========================
# SAVE IMAGE
# =========================

img.save("clean_house_128.png")

# =========================
# GROUND TRUTH
# ONLY STRONG CORNERS
# =========================

gt_points = [

    # Roof peak
    (64, 25),

    # Roof-body junctions
    (24, 55),
    (104, 55),

    # Body bottom corners
    (34, 104),
    (94, 104),

    # Door top corners
    (54, 74),
    (74, 74),

    # Door bottom corners
    (54, 104),
    (74, 104)
]

# =========================
# SAVE GT FILE
# =========================

with open("clean_house_gt.txt", "w") as f:

    for x, y in gt_points:

        f.write(f"{x} {y}\n")

print("Clean house and accurate GT generated.")