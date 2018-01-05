# Copyright 2018 Kouhei Sutou <kou@clear-code.com>
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

module Parquet
  module ArrowTableLoadable
    private
    def load_as_parquet(path)
      reader = Parquet::ArrowFileReader.new(path)
      reader.n_threads = @options[:n_threads] || 4 # TODO
      reader.read_table
    end
  end
end

module Arrow
  class TableLoader
    include Parquet::ArrowTableLoadable
  end
end
