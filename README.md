# Elixir in Action Book Notes

This README file contains my notes from the book Elixir in Action by Saša Juric´. These notes serve as a quick reference and summary of key concepts covered in the book. They are meant to provide a concise overview of important topics and serve as a helpful resource for as I learn and work with Elixir.

## Table of Contents

- [Elixir in Action Book Notes](#elixir-in-action-book-notes)
  - [Table of Contents](#table-of-contents)
  - [Chapter 1: First Steps](#chapter-1-first-steps)
  - [Chapter 2: Building Blocks](#chapter-2-building-blocks)
  - [Chapter 3: Control Flow](#chapter-3-control-flow)
  - [Chapter 4: Topic 4](#chapter-4-topic-4)

## Chapter 1: First Steps

- Overview of Erlang
- Benefits of Elixir
- Elixir is a  hybrid language. It is a functional language with a strong emphasis on concurrency and fault tolerance. It is also a dynamic language with a strong focus on productivity and extensibility.
- Elixir is a compiled language. It is compiled to bytecode that runs on the Erlang VM (BEAM).
- Elixir is a functional language. It is immutable, has first-class functions, and has pattern matching.
- Elixir is a dynamic language. It is dynamically typed, has a REPL, and has metaprogramming capabilities.
- Sharing no memory, processes communicate via asynchronous messages.
- Typical Erlang systems are divided into a large number of concurrent processes
- Garbage collection is per process and is non-blocking (no stop-the-world pauses).
- Macros are expanded at compile time. They are used to extend the language.
- Assignment == Binding. `=` is used for binding. It does not mutate variables.
- Arity is the number of arguments a function takes.
- Map, List, Tuple, Atoms are the basic data types.
- Pattern Matching is when a value is matched against a pattern. It is used to destructure data structures and to control the flow of execution.
- Immutability is a core principle of functional programming. It means that once a value is bound to a variable, it cannot be changed.

## Chapter 2: Building Blocks

- Capture Operator `&` is used to capture a function into a variable. It is used to pass functions as arguments to other functions. It is also used to create anonymous functions. Example:
  ```elixir
    &(&1 + 1)
  ```
  is an anonymous function that takes one argument and adds 1 to it.
- Pipe Operator `|>` is used to chain functions together. It takes the result of the expression on the left and passes it as the first argument to the function on the right. Example:
  ```elixir
    1 |> &(&1 + 1) == &(&1 + 1).(1)
  ```
- Lambda Syntax `fn` is used to create anonymous functions. Example:
  ```elixir
    fn x -> x + 1 end
  ```
  is an anonymous function that takes one argument and adds 1 to it.
- Anonymous functions are closures. They capture the bindings in the scope where they are defined.
- Closure is a function that captures bindings from its enclosing scope.
- PID is a process identifier. It is used to send messages to a process.
- Port identifiers are used to communicate with external programs.
- Range is a data type that represents a range of values. Example `1..10` is a range from 1 to 10.
- Keyword list is a list of tuples where the first element of each tuple is an atom. Example:
  ```elixir
    [{:a, 1}, {:b, 2}]
  ```
  is a keyword list.
- Mapset is a set of unique values. Example:
  ```elixir
    %{1 => :one, 2 => :two}
  ```
  is a mapset.
- Sigils are used to create data structures. Example `~w(foo bar)` is a list of words. Example `~r/foo/` is a regular expression.
- Syntatic sugar is a syntax that is easier to read and write than the underlying syntax. Example `1 + 1` is syntatic sugar for `+(1, 1)`.
- Time and date are represented as tuples. Example `{2019, 1, 1}` is January 1, 2019. Datetime is represented as a tuple. Example `{2019, 1, 1, 12, 0, 0}` is January 1, 2019 at 12:00:00. Native datetime is represented as a tuple. Example `{2019, 1, 1, 12, 0, 0, 0}` is January 1, 2019 at 12:00:00.000.
- IO lists are used to represent binary data. They are used to avoid copying data when writing to a file or socket. Example:
  ```elixir
    [1, 2, 3]
  ```
  is an IO list.

  Example:
  ```elixir
  <<1, 2, 3>>
  ```
  is a binary.

  Example:
    ```elixir
      <<1, 2, 3>> <> <<4, 5, 6>>
    ```
  is a binary concatenation.
- Elixir runtime is a BEAM instance. It is a virtual machine that runs Elixir code.

## Chapter 3: Control Flow

- Idioms are common patterns in Elixir. They are used to solve common problems. Example `case` is an idiom for pattern matching. Example `if` is an idiom for conditional execution.
  ```elixir
    case File.read("file.txt") do
      {:ok, contents} -> IO.puts("File contents: #{contents}")
      {:error, reason} -> IO.puts("Error reading file: #{reason}")
    end
  ```
- Anonymous variables are used when a variable is not used in a pattern match. Example `{:ok, _}` is a pattern match that ignores the second element of the tuple.
- Pattern matching happen with (Tuples, Lists, maps) and (Binaries, Strings, Bitstrings).
- Matching bitstrings and binaries. Example:
  ```elixir
    <<1, 2, 3>> = <<1, 2, 3>>
    binary = <<1, 2, 3>>
    << a, b, c >> = binary
    a # => 1
  ```
- Matching lists. Example:
  ```elixir
    [1, 2, 3] = [1, 2, 3]
  ```
- Matching maps. Example:
  ```elixir
    %{a: 1, b: 2} = %{a: 1, b: 2}
  ```
- Matching binary strings. Example:
  ```elixir
    <<a, b, c>> = "ABC"
    a # => 65
  ```
- Compound matches. Example:
  ```elixir
    [head | tail] = [1, 2, 3]
    head # => 1
    tail # => [2, 3]
    [{a, b} | tail] = [{1, 2}, {3, 4}, {5, 6}]
    a # => 1
  ```

## Chapter 4: Topic 4

- Note 1: [Your note here]
- Note 2: [Your note here]
- ...