# Copyright 2017 Kouhei Sutou <kou@clear-code.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class TestArrowFileReader < Test::Unit::TestCase
  def test_read_write
    tempfile = Tempfile.open(["data", ".parquet"])

    values = [true, nil, false, true]
    chunk_size = 2

    field = Arrow::Field.new("enabled", Arrow::BooleanDataType.new)
    schema = Arrow::Schema.new([field])
    Parquet::ArrowFileWriter.open(schema, tempfile.path) do |writer|
      columns = [
        Arrow::Column.new(field, Arrow::BooleanArray.new(values)),
      ]
      table = Arrow::Table.new(schema, columns)
      writer.write_table(table, chunk_size)
    end

    reader = Parquet::ArrowFileReader.new(tempfile.path)
    reader.n_threads = 4
    assert_equal(chunk_size, reader.n_row_groups)
    table = reader.read_table
    table_data = table.each_column.collect do |column|
      [column.name, column.to_a]
    end
    assert_equal([["enabled", values]], table_data)
  end
end
