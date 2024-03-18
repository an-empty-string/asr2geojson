import sys

with open(sys.argv[1], "rb") as f:
    with open(sys.argv[2], "wb") as g:
        g.write(
            f.read()
            .replace(b"\r\r\n", b" ")
            .replace(b"\r\n", b"\n")
            .replace(b"\r", b" ")
        )
