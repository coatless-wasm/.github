# R and Python in the Browser

Welcome to [@coatless](https://github.com/coatless) and contributors' projects for running R and Python in the browser.
Each one turns a folder of scripts, data files and a list of packages into a static website where the code runs on the visitor's own computer, through [webR](https://docs.r-wasm.org/webr/latest/) or [Pyodide](https://pyodide.org). Nothing runs on a server, so any static host will do.

<picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/coatless-wasm/webrarian/main/man/figures/hero-dark.svg"><img src="https://raw.githubusercontent.com/coatless-wasm/webrarian/main/man/figures/hero-light.svg" alt="You write a folder with R files, data and a list of packages. bind() builds it into _site/, one static folder with the page, the workspace, the webR engine, the packages and your files. Readers open it from any static host and get a live R workspace in their browser, with an editor, a console, your files and plots, and nothing to install." width="100%"/></picture>

## Projects

Each project is maintained in its own repository.

| Project | Language | Purpose |
|---------|----------|---------|
| [webrarian](https://github.com/coatless-wasm/webrarian) | R | Builds a site from R scripts, data files and packages. Read the [documentation](https://coatless-wasm.github.io/webrarian/) or try the [live demo](https://coatless-wasm.github.io/webrarian/demo/). |
| pyodidarian | Python | The Python counterpart of webrarian, with the same function names. Not public yet. |
| exlibris | TypeScript | The workspace every site opens in the browser: an editor, a console, a files panel and a plot pane. webrarian and pyodidarian each carry a prebuilt copy. Not public yet. |

## Installation

webrarian installs from GitHub:

```r
# install.packages("pak")
pak::pak("coatless-wasm/webrarian")
```

Then build a first site and preview it:

```r
library(webrarian)
catalog("my-site")
acquire_package("dplyr", path = "my-site")
bind("my-site")
reading_room("my-site")
```

## Requirements

We assume at least the following is available:

- R (>= 4.4)
- A current web browser, to open a site
- Docker, only to compile local and GitHub packages (prebuilt packages need none)
- Additional dependencies specified in each repository

## Contact

For questions, suggestions, or issues:

- Open an issue in the relevant repository
- Report a security problem privately, as the [security policy](https://github.com/coatless-wasm/.github/blob/main/SECURITY.md) describes
- Contact [@coatless](https://github.com/coatless) directly through [social media](https://thecoatlessprofessor.com/)

## License

webrarian is licensed under AGPL-3, and the sites it generates are yours to license as you choose (see [`LICENSE.note`](https://github.com/coatless-wasm/webrarian/blob/main/LICENSE.note)).

## Acknowledgments

We thank all contributors who have helped improve and maintain these projects. Special thanks to the [webR](https://github.com/r-wasm/webr) and [Pyodide](https://github.com/pyodide/pyodide) teams, whose work brings R and Python to the browser, and to the R and Python communities for their continued support and inspiration.

---

*This organization is maintained by [@coatless](https://github.com/coatless). For more information about other projects, visit [thecoatlessprofessor.com](https://thecoatlessprofessor.com).*
