open Alcotest;

let test_hello_with_name = (name, ()) => {
  let greeting = Demo.greet(name);
  let expected = "Hello " ++ name ++ "!";
  check(string, "same string", greeting, expected);
};

let suite = [
  ("can greet Tom", `Quick, test_hello_with_name("Tom")),
  ("can greet John", `Quick, test_hello_with_name("John")),
];

let () = Alcotest.run("demo", [("Demo", suite)]);
