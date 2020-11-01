# Create documents using LaTeX and Docker

This image is built to generate a Docker container with the full `texlive` distribution installed in order to generate PDF files using LaTeX.

Moreover, Pygments and GhostScript are also available on the built image in case they are needed.

The main advantage of using this Docker image is that the installation of packages for using LaTeX is not required.

The image will work using a certain project structure. There is a template posted on https://github.com/7Rocky/plantilla-informe-LaTeX. Although it is in Spanish, it is easy to follow. Basically, the project structure is:

```bash
├── compress.sh
├── src/
│   └── ...
└── template/
    ├── _minted-main/
    │   └── ...
    ├── bibliography/
    │   └── sample.bib
    ├── images/
    │   └── ...
    ├── lexers/
    │   └── ...
    ├── main-compressed.pdf
    ├── main.aux
    ├── main.log
    ├── main.out
    ├── main.pdf
    ├── main.tex
    ├── packages/
    │   └── ...
    └── subfiles/
        ├── .../
        └── document.tex
```

The command to compile the project is:

```bash
docker run --rm -v $(pwd)/..:/project -it 7rocky/latex
```

It is important that the absolute path to the working directory (`pwd`) does not contain spaces.
