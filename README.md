<h1 align="center">spin-reason-bin</h1>

<p align="center">
  <a href="https://github.com/tmattio/spin">Spin</a> generator for binary applications with <a href="https://reasonml.github.io/">Reason</a> and <a href="https://esy.sh/">Esy</a> support.
</p>

```bash
opam spin new https://github.com/ocaml-templates/spin-reason-bin.git
```

You can see a generated project with Reason and Esy in the [`example/`](example/) directory.

## Requirements

- To use the `opam` package manager, you'll need `opam >= 2.0` installed on your system.
  You can see the installation instructions at https://opam.ocaml.org/doc/Install.html.

  **TL;DR:** if you are running on Linux or macOS, you can run:
  ```
  sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)
  ```

- To use the `Esy` package manager, you'll need `esy` installed on your system.
  You can see the installation instructions at https://esy.sh/docs/en/getting-started.html.

  **TL;DR:** you can install it with npm:
  ```
  npm install -g esy
  ```
## Acknowledgments

This template is inspired by these awesome projects:

- [hello-reason](https://github.com/esy-ocaml/hello-reason) - An example esy-powered Reason project.
- [pesy-reason-template](https://github.com/esy/pesy-reason-template) - Default template for pesy.
