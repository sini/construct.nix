# Hello, World in .NET

This flake defines:

- `nix run .#fantomas -- -r .` to run the
  [Fantomas](https://fsprojects.github.io/fantomas/) F# source formatter.
- `nix develop . --command alejandra .` to run the
  [Alejandra](https://github.com/kamadorueda/alejandra) Nix source formatter.
- `nix develop . --command markdown-link-check README.md` to check that this
  README's links are not broken.
- `nix develop . --command bash -c "find . -type f -name '*.sh' | xargs shellcheck"`
  to check all shell scripts in this repository.
- `nix run . --` to run the application.
- `nix run .#fetchDeps` to collect the [NuGet] dependencies of the project into
  the [lockfile](./nix/deps.nix). (You only have to run this after you change
  the NuGet dependencies of the .NET projects.)

## Development

When you want to add a [NuGet] dependency, you will have to rerun
`nix run .#fetchDeps`, whose final line of output will tell you which file in
your machine's temporary storage it's written its output to. Copy that file to
`./nix/deps.nix`. If you forget to do this, you'll see `nix build` fail at the
NuGet restore stage, because it's not talking to NuGet but instead is using the
dependencies present in the Nix store; if you haven't run `fetchDeps`, those
dependencies will not be in the store. (Note that the file as generated does not
conform to Alejandra's formatting requirements, so you will probably also want
to `nix develop . --command alejandra .` afterwards.)

## Style guidelines

This template is _opinionated_ about the style guidelines it uses. The F#
community at large tends to disagree with these guidelines, and you may wish to
adjust the [editorconfig](./.editorconfig) file to suit your own needs.

[NuGet](https://www.nuget.org)
