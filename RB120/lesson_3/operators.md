# Operators

Below is a table that shows which operators are real operators, and which are methods disguised as operators (listed by order of precedence; highest first).

<table>
   <thead>
      <tr>
         <th>Method</th>
         <th>Operator</th>
         <th>Description</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>no</td>
         <td>
            <code>.</code>, <code>::</code>
         </td>
         <td>Method/constant resolution operators</td>
      </tr>
      <tr>
         <td>yes</td>
         <td>
            <code>[]</code>, <code>[]=</code>
         </td>
         <td>Collection element getter and setter.</td>
      </tr>
      <tr>
         <td>yes</td>
         <td><code>**</code></td>
         <td>Exponential operator</td>
      </tr>
      <tr>
         <td>yes</td>
         <td>
            <code>!</code>, <code>~</code>, <code>+</code>, <code>-</code>
         </td>
         <td>Not, complement, unary plus and minus (method names for the last two are +@ and -@)</td>
      </tr>
      <tr>
         <td>yes</td>
         <td>
            <code>*</code>, <code>/</code>, <code>%</code>
         </td>
         <td>Multiply, divide, and modulo</td>
      </tr>
      <tr>
         <td>yes</td>
         <td>
            <code>+</code>, <code>-</code>
         </td>
         <td>Plus, minus</td>
      </tr>
      <tr>
         <td>yes</td>
         <td>
            <code>&gt;&gt;</code>, <code>&lt;&lt;</code>
         </td>
         <td>Right and left shift</td>
      </tr>
      <tr>
         <td>yes</td>
         <td><code>&amp;</code></td>
         <td>Bitwise "and"</td>
      </tr>
      <tr>
         <td>yes</td>
         <td>
            <code>^</code>, <code>|</code>
         </td>
         <td>Bitwise exclusive "or" and regular "or" (inclusive "or")</td>
      </tr>
      <tr>
         <td>yes</td>
         <td>
            <code>&lt;=</code>, <code>&lt;</code>,**** <code>&gt;</code>, <code>&gt;=</code>
         </td>
         <td>Less than/equal to, less than, greater than, greater than/equal to</td>
      </tr>
      <tr>
         <td>yes</td>
         <td>
            <code>&lt;=&gt;</code>, <code>==</code>, <code>===</code>, <code>!=</code>, <code>=~</code>, <code>!~</code>
         </td>
         <td>Equality and pattern matching (<code>!=</code> and <code>!~</code> cannot be directly defined)</td>
      </tr>
      <tr>
         <td>no</td>
         <td><code>&amp;&amp;</code></td>
         <td>Logical "and"</td>
      </tr>
      <tr>
         <td>no</td>
         <td><code>||</code></td>
         <td>Logical "or"</td>
      </tr>
      <tr>
         <td>no</td>
         <td>
            <code>..</code>, <code>...</code>
         </td>
         <td>Inclusive range, exclusive range</td>
      </tr>
      <tr>
         <td>no</td>
         <td><code>? :</code></td>
         <td>Ternary if-then-else</td>
      </tr>
      <tr>
         <td>no</td>
         <td>
            <code>=</code>, <code>%=</code>, <code>/=</code>, <code>-=</code>, <code>+=</code>, <code>|=</code>, <code>&amp;=</code>, <code>&gt;&gt;=</code>, <code>&lt;&lt;=</code>, <code>*=</code>, <code>&amp;&amp;=</code>, <code>||=</code>, <code>**=</code>, <code>{</code>
         </td>
         <td>Assignment (and shortcuts) and block delimiter</td>
      </tr>
   </tbody>
</table>

## Syntacitc Sugar

Many methods (aka, fake operators) look like operators because Ruby gives us special syntactical sugar when invoking those methods.

Some fake operators examples:

- The plus method

```ruby
1 + 1                                       # => 2
1.+(1)                                      # => 2
```

- Element setter and getter methods

```ruby
my_array = %w(first second third fourth)    # ["first", "second", "third", "fourth"]

# element reference
my_array[2]                                 # => "third"
my_array.[](2)                              # => "third"

# element assignment
my_array[4] = "fifth"
puts my_array.inspect                       # => ["first", "second", "third", "fourth", "fifth"]

my_array.[]=(5, "sixth")
puts my_array.inspect                       # => ["first", "second", "third", "fourth", "fifth", "sixth"]
```

- The equality method

```ruby
1 == 1                                       # => true
1.==(1)                                      # => 2
```

Defining this method also gives us a `!=` method automatically.
