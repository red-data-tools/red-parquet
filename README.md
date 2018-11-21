# README

This project has been donated to Apache Arrow: https://github.com/apache/arrow/tree/master/ruby/red-parquet

## Name

Red Parquet

## Description

Red Parquet is a Ruby bindings of Apache Parquet. Red Parquet is based on GObject Introspection.

[Apache Parquet](https://parquet.apache.org/) is a columnar storage format.

[GObject Introspection](https://wiki.gnome.org/action/show/Projects/GObjectIntrospection) is a middleware for language bindings of C library. GObject Introspection can generate language bindings automatically at runtime.

Red Parquet uses [Parquet GLib](https://github.com/red-data-tools/parquet-glib) and [gobject-introspection gem](https://rubygems.org/gems/gobject-introspection) to generate Ruby bindings of Apache Parquet.

Parquet GLib is a C wrapper for [Parquet C++](https://github.com/apache/parquet-cpp). GObject Introspection can't use Parquet C++ directly. Parquet GLib is a bridge between Parquet C++ and GObject Introspection.

gobject-introspection gem is a Ruby bindings of GObject Introspection. Red Parquet uses GObject Introspection via gobject-introspection gem.

## Install

Install Parquet GLib before install Red Parquet. Use [Apache Arrow packages](https://github.com/red-data-tools/arrow-packages) for installing Parquet GLib.

Install Red Parquet after you install Parquet GLib:

```text
% gem install red-parquet
```

## Usage

```ruby
require "parquet"

# Load Parquet data as Arrow::Table
table = Arrow::Table.load("data.parquet")

# Save Arrow::Table as Parquet data
table.save("data.parquet")
```

## Dependencies

* [Apache Parquet C++](https://github.com/apache/parquet-cpp) with Apache Arrow support

* [Parquet GLib](https://github.com/red-data-tools/parquet-glib)

* [Red Arrow](https://rubygems.org/gems/red-arrow)

## Authors

* Kouhei Sutou \<kou@clear-code.com\>

## License

Apache License 2.0. See doc/text/apache-2.0.txt for details.

(Kouhei Sutou has a right to change the license including contributed
patches.)
