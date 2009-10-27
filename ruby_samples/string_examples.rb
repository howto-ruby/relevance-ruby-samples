# codecite dq
def print_string_message_dq
  puts "Double-quoted strings can include escaped characters such as \\n and \\\\"
  puts "as well as interpolated Ruby expressions like \#{Time.now}."
end
# codecite dq

# codecite sq
def print_string_message_sq
  puts 'Double-quoted strings can include escaped characters such as \n and \\\\'
  puts 'as well as interpolated Ruby expressions like #{Time.now}.'
end
# codecite sq

# codecite gdi
def print_string_message_gdi
  puts %q{Double-quoted strings can include escaped characters such as \n and \\\\
as well as interpolated Ruby expressions like #{Time.now}.}
end
# codecite gdi

# codecite hd
def print_string_message_hd
  puts <<'EOS'
Double-quoted strings can include escaped characters such as \n and \\
as well as interpolated Ruby expressions like #{Time.now}.
EOS
end
# codecite hd

# codecite delete_matches
class String
  def delete_matches(substr)
    result = dup
    while pos = result.index(substr)
      result[pos, substr.size] = ''
    end
    result
  end
end  
# codecite delete_matches

# codecite bang_delete_matches
class String
  def delete_matches!(substr)
    while pos = index(substr)
      self[pos, substr.size] = ''
    end
    self
  end
end  
# codecite bang_delete_matches

# codecite revised_delete_matches
class String
  def delete_matches(substr)
    dup.delete_matches!(substr)
  end
end  
# codecite revised_delete_matches

# codecite lookups
def many_lookups(keys)
  h = {}
  keys.each{|k| h[k] = rand(100)}
  1_000_000.times do
    key = keys[rand(keys.size)]
    v = h[key]
  end
end
# codecite lookups

# codecite bench
require 'benchmark'
def lookup_benchmark
  strings = %w{slkfasjkadfja adklskjlasjklafkls sajkldjklafsa dskljdjklsajkladsjkls jkdasadjaahjsadfks
               dfhjadfhjhjkaf ajdfsdfjksajkadfs jkdfsjkdfsjkafs hjkadfsjhkaskhjkdfs adfjsjkalfajkslhjk}
  symbols = strings.map{|s| s.to_sym}
  Benchmark.bm(7) do |bm|
    bm.report("strings") { many_lookups strings }
    bm.report("symbols") { many_lookups symbols }
  end
end
# codecite bench
