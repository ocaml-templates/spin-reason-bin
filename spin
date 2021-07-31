(inherit
  (official bin)
  (overwrites (actions example_commands)))

(name reason-bin)
(description "Spin generator for binary applications with Reason and Esy support")

(config syntax
  (select
    (prompt "Which syntax do you use?")
    (values OCaml Reason)))

(config package_manager
  (select
    (prompt "Which package manager do you use?")
    (values Opam Esy))
  (default (if (eq :syntax Reason) Esy Opam)))

(ignore 
  (files .ocamlformat)
  (enabled_if (neq :syntax OCaml)))

(ignore
  (files esy.json)
  (enabled_if (neq :package_manager Esy)))

(ignore
  (files Makefile)
  (enabled_if (neq :package_manager Opam)))

; We need to do this because Dune won't copy .github during build.
; Since we override the actions when inheriting, we need copy this
; from the original template.
(post_gen
  (actions
    (run mv github .github))
  (enabled_if (eq :ci_cd GitHub)))

(post_gen
  (actions
    (run esy install)
    (run esy dune build))
  (message "🎁  Installing packages. This might take a couple minutes.")
  (enabled_if (eq :package_manager Esy)))

(post_gen
  (actions
    (run make create_switch)
    (run make deps)
    (run make build))
  (message "🎁  Installing packages in a switch. This might take a couple minutes.")
  (enabled_if (and (eq :package_manager Opam) (eq :create_switch true))))

(post_gen
  (actions
    (run make deps)
    (run make build))
  (message "🎁  Installing packages globally. This might take a couple minutes.")
  (enabled_if (and (eq :package_manager Opam) (eq :create_switch false))))

(post_gen
  (actions
    (refmt bin/*.ml bin/*.mli lib/*.ml lib/*.mli test/*.ml test/*.mli test/*/*.ml test/*/*.mli))
  (enabled_if (eq :syntax Reason)))

(example_commands
  (commands 
    ("esy install" "Download and lock the dependencies.")
    ("esy build" "Build the dependencies and the project.")
    ("esy test" "Starts the test runner."))
  (enabled_if (eq :package_manager Esy)))

(example_commands
  (commands
    ("make deps" "Download runtime and development dependencies.")
    ("make build" "Build the dependencies and the project.")
    ("make test" "Starts the test runner."))
  (enabled_if (eq :package_manager Opam)))
