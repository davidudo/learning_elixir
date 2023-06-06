# Elixir in Action Book Notes

This README file contains my notes from the book Elixir in Action by Saša Juric´. These notes serve as a quick reference and summary of key concepts covered in the book. They are meant to provide a concise overview of important topics and serve as a helpful resource for as I learn and work with Elixir.

## Table of Contents

- [Elixir in Action Book Notes](#elixir-in-action-book-notes)
  - [Table of Contents](#table-of-contents)
  - [Chapter 1: First Steps](#chapter-1-first-steps)
  - [Chapter 2: Building Blocks](#chapter-2-building-blocks)
  - [Chapter 3: Control Flow](#chapter-3-control-flow)
  - [Chapter 4: Data Abstractions](#chapter-4-data-abstractions)
  - [Chapter 5: Concurrency Primitives](#chapter-5-concurrency-primitives)
  - [Chapter 6: Generic Server Processes](#chapter-6-generic-server-processes)

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
- Matching with functions. Example:
  ```elixir
    defmodule Math do
      def zero?(0), do: true
      def zero?(_), do: false
    end
    Math.zero?(0) # => true
    Math.zero?(1) # => false
  ```
- Multiclause functions. Example:
  ```elixir
    defmodule Math do
      def zero?(0), do: true
      def zero?(_), do: false
    end
    Math.zero?(0) # => true
    Math.zero?(1) # => false
  ```
- Guard clauses. Example:
  ```elixir
    defmodule Math do
      def zero?(0), do: true
      def zero?(x) when is_integer(x), do: false
    end
    Math.zero?(0) # => true
    Math.zero?(1) # => false
  ```
- Anonymous functions. Example:
  ```elixir
    fn
      0 -> true
      x when is_integer(x) -> false
    end
  ```
- Anonymous functions with multiple clauses. Example:
  ```elixir
    fn
      0 -> true
      x when is_integer(x) -> false
    end
  ```
- Branching with multiclause functions. Example:
  ```elixir
    defmodule Math do
      def zero?(0), do: true
      def zero?(x) when is_integer(x), do: false
    end
    Math.zero?(0) # => true
    Math.zero?(1) # => false
  ```
- Classical branching constructs. Example:
  ```elixir
    if true do
      "This works!"
    end
  ```
- `if` is an expression. Example:
  ```elixir
    if true, do: "This works!"
  ```
- `unless` is an expression. Example:
  ```elixir
    unless true, do: "This works!"
  ```
- `cond` is an expression. Example:
  ```elixir
    cond do
      2 + 2 == 5 ->
        "This will not be true"
      2 * 2 == 3 ->
        "Nor this"
      1 + 1 == 2 ->
        "But this will"
    end
  ```
- `case` is an expression. Example:
  ```elixir
    case {:ok, "Hello world"} do
      {:ok, result} ->
        "Result is #{result}"
      {:error, error} ->
        "Error is #{error}"
    end
  ```
- The with special form. Example:
  ```elixir
    with {:ok, file} <- File.open("hello.txt"),
         content <- IO.read(file) do
      "File contents: #{content}"
    else
      :error -> "Error reading file"
    end
  ```
- Loops and iteration. Example:
  ```elixir
    for n <- [1, 2, 3], do: n * n
  ```
- Recursion. Example:
  ```elixir
    defmodule Recursion do
      def sum_list([head | tail], accumulator) do
        sum_list(tail, head + accumulator)
      end
      def sum_list([], accumulator) do
        accumulator
      end
    end
    Recursion.sum_list([1, 2, 3], 0) # => 6
  ```
- Tail function calls. Example:
  ```elixir
    defmodule Recursion do
      def sum_list([head | tail], accumulator) do
        sum_list(tail, head + accumulator)
      end
      def sum_list([], accumulator) do
        accumulator
      end
    end
    Recursion.sum_list([1, 2, 3], 0) # => 6
  ```
- Higher-order functions. Example:
  ```elixir
    Enum.map([1, 2, 3], fn n -> n * n end)
  ```
- Comprehensions. Example:
  ```elixir
    for n <- [1, 2, 3], do: n * n
  ```
- Streams. Example:
  ```elixir
    Stream.map([1, 2, 3], fn n -> n * n end)
  ```

## Chapter 4: Data Abstractions

- Abstraction with modules and functions. Example:
  ```elixir
    defmodule Math do
      def sum(a, b) do
        a + b
      end
    end
    Math.sum(1, 2) # => 3
  ```
- Composing abstractions with pipes. Example:
  ```elixir
    "hello world"
    |> String.split()
    |> Enum.reverse()
    |> Enum.join(" ")
  ```
- Structuring data with maps. Example:
  ```elixir
    %{
      name: "Dave",
      city: "Dallas",
      likes: "Programming"
    }
  ```
- Abstracting with structs. Example:
  ```elixir
    defmodule Person do
      defstruct name: "", city: "", likes: ""
    end
    %Person{name: "Dave", city: "Dallas", likes: "Programming"}
  ```
- Data transparency. Example:
  ```elixir
    %Person{name: "Dave", city: "Dallas", likes: "Programming"}
    |> Map.put(:likes, "Functional programming")
  ```

## Chapter 5: Concurrency Primitives

- Concurrency in BEAM languages. Example:
  ```elixir
    spawn fn -> 1 + 2 end
  ```
- Sending messages. Example:
  ```elixir
    self() # => #PID<0.87.0>
    send(self(), {:hello, "world"})
  ```
- `receive` blocks. Example:
  ```elixir
    receive do
      {:hello, msg} -> msg
    end
  ```
- `receive` blocks with timeouts. Example:
  ```elixir
    receive do
      {:hello, msg} -> msg
    after
      1_000 -> "Nothing after 1 second"
    end
  ```
- Stateful server processes. Example:
  ```elixir
    defmodule Counter do
      def start(initial_count) do
        spawn fn -> loop(initial_count) end
      end

      defp loop(count) do
        receive do
          {:inc, sender} ->
            sender |> send({:ok, count + 1})
            loop(count + 1)
          {:get, sender} ->
            sender |> send({:ok, count})
            loop(count)
        end
      end
    end
    {:ok, pid} = Counter.start(0)
    send(pid, {:inc, self()})
    receive do
      {:ok, count} -> count
    end
  ```

## Chapter 6: Generic Server Processes

- Generic server processes. Example:
  ```elixir
    defmodule Counter do
      def start(initial_count) do
        spawn_link fn -> loop(initial_count) end
      end

      defp loop(count) do
        receive do
          {:inc, sender} ->
            sender |> send({:ok, count + 1})
            loop(count + 1)
          {:get, sender} ->
            sender |> send({:ok, count})
            loop(count)
        end
      end
    end
    {:ok, pid} = Counter.start(0)
    send(pid, {:inc, self()})
    receive do
      {:ok, count} -> count
    end
  ```
- Using Genserver. Example:
  ```elixir
    defmodule Counter do
      use GenServer

      def start_link(initial_count) do
        GenServer.start_link(__MODULE__, initial_count)
      end

      def init(initial_count) do
        {:ok, initial_count}
      end

      def inc do
        GenServer.cast(__MODULE__, :inc)
      end

      def get do
        GenServer.call(__MODULE__, :get)
      end

      def handle_cast(:inc, count) do
        {:noreply, count + 1}
      end

      def handle_call(:get, _from, count) do
        {:reply, count, count}
      end
    end
    {:ok, pid} = Counter.start_link(0)
    Counter.inc()
    Counter.get()
  ```
- Using Genserver with state. Example:
  ```elixir
    defmodule Counter do
      use GenServer

      def start_link(initial_count) do
        GenServer.start_link(__MODULE__, initial_count)
      end

      def init(initial_count) do
        {:ok, initial_count}
      end

      def inc do
        GenServer.cast(__MODULE__, :inc)
      end

      def get do
        GenServer.call(__MODULE__, :get)
      end

      def handle_cast(:inc, count) do
        {:noreply, count + 1}
      end

      def handle_call(:get, _from, count) do
        {:reply, count, count}
      end
    end
    {:ok, pid} = Counter.start_link(0)
    Counter.inc()
    Counter.get()
  ```
