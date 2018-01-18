#!/bin/ruby

# Complete the functions below.

def dictionaryToJson(dictionary)
    res = '{'
    dictionary.each do |k,v|
        res << "#{k}:"
        if v.is_a?(String)
            res << v
        else
            res << dictionaryToJson(v)
        end
        res << ','
    end
    res = res[0..-2]
    res << '}'
end

def jsonToDictionary(json)
    res = {}

    idx = 1
    while idx < json.length
        jdx = idx
        jdx += 1 until json[jdx] == ':'
        curr_key = json[idx...jdx]
        jdx += 1

        if json[jdx] == '{' # then val is a hash
            # walk until ending }
            brace = 1

            brace_idx = jdx + 1
            until brace == 0
                brace += 1 if json[brace_idx] == '{'
                brace -= 1 if json[brace_idx] == '}'
                brace_idx += 1
            end


            res[curr_key] = jsonToDictionary(json[jdx..brace_idx])
            if json[brace_idx + 1] == ','
                idx = brace_idx + 2
            else
                break
            end
        else
            # walk until comma or }
            val_end_idx = jdx
            until json[val_end_idx] == ',' || json[val_end_idx] == '}'
                val_end_idx += 1
            end

            res[curr_key] = json[jdx...val_end_idx]

            if json[val_end_idx] == ','
                idx = val_end_idx + 1
            else
                break
            end
        end
    end

    res
end


ex_dic = {
    'a' => 'apple',
    'b' =>
        {'b' => 'blueberry', 'c' => 'cranberry'}

}
# p dictionaryToJson(ex_dic)

ex_json = '{a:apple,b:{b:blueberry,c:cranberry}}'
p jsonToDictionary(ex_json)
