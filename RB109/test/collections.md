# Notes on Special Topic of Interest for RB109:

## working with collections (Array, Hash, String)

A collection is any class that represents a collection of values.
Collections are made up of individual elements. In order to work with collections we need to understand how they are structured and how to reference and assign the individual elements within them.

### Element Reference

##### String Element Reference

Strings use an integer-based index that represents each character in the string. The index starts counting at zero and increments by one for the remaining index values. You can reference a specific character using this index.

##### Array Element Reference

Arrays are lists of elements that are ordered by index, where each element can be any object. Arrays use an integer-based index to maintain the order of its elements (zero-indexed). A specific element can be referenced using its index.

##### Hash Element Reference

Hashes are another very common collection data structure that, instead of using an integer-based index, uses key-value pairs, where the key or the value can be any type of Ruby object. This allows for a more expansive and descriptive collection of elements.

##### Element Reference Gotchas

###### Out of Bounds Indices

Referencing an out-of-bounds index returns nil.

###### Negative Indices

Elements in String and Array objects can be referenced using negative indices, starting from the last index in the collection -1 and working backwards.

###### Invalid Hash Keys

Referencing a missing key object returns nil.

### Element Assignment

Element assigment is a destructie action.

References:
https://launchschool.com/lessons/85376b6d/assignments/39c98ed0

