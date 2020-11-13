  -- main code
  function lookupify(b)
    for a, a in pairs(b) do
      b[a] = true
    end
    return b
  end
  function CountTable(a)
    local b = 0
    for a in pairs(a) do
      b = b + 1
    end
    return b
  end
  function FormatTableInt(d, c, b)
    if d.Print then
      return d.Print()
    end
    c = c or 0
    local e = (CountTable(d) > 1)
    local a = string.rep('    ', c + 1)
    local h = "{"..(e and '\n' or '')
    for g, f in pairs(d) do
      if type(f) ~= 'function' and not b(g) then
        h = h..(e and a or '')
        if type(g) == 'number' then
        print('numb')
        elseif type(g) == 'string' and g:match("^[A-Za-z_][A-Za-z0-9_]*$") then
          h = h..g.." = "
        elseif type(g) == 'string' then
          h = h.."[\""..g.."\"] = "
        else
          h = h.."["..tostring(g).."] = "
        end
        if type(f) == 'string' then
          h = h.."\""..f.."\""
        elseif type(f) == 'number' then
          h = h..f
        elseif type(f) == 'table' then
          h = h..FormatTableInt(f, c + (e and 1 or 0), b)
        else
          h = h..tostring(f)
        end
        if next(d, g) then
          h = h..","
        end
        if e then
          h = h..'\n'
        end
      end
    end
    h = h..(e and string.rep('    ', c) or '').."}"
    return h
  end
  function FormatTable(a, b)
    b = b or function()
      return false
    end
    return FormatTableInt(a, 0, b)
  end
  local m = lookupify{
    ' ',
    '\n',
    '\t',
    '\r',
  }
  local a = {
    ['\r'] = '\\r',
    ['\n'] = '\\n',
    ['\t'] = '\\t',
    ['"'] = '\\"',
    ["'"] = "\\'",
    ['\\'] = '\\'
  }
  local k = {
    ['r'] = '\r',
    ['n'] = '\n',
    ['t'] = '\t',
    ['"'] = '"',
    ["'"] = "'",
    ['\\'] = '\\'
  }
  local f = lookupify{
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    '_'
  }
  local n = lookupify{
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    '_',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'
  }
  local o = lookupify{
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'
  }
  local d = lookupify{
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'A',
    'a',
    'B',
    'b',
    'C',
    'c',
    'D',
    'd',
    'E',
    'e',
    'F',
    'f'
  }
  local c = lookupify{
    '+',
    '-',
    '*',
    '/',
    '^',
    '%',
    ',',
    '{',
    '}',
    '[',
    ']',
    '(',
    ')',
    ';',
    '#',
    '.',
    ':'
  }
  local g = lookupify{
    '~',
    '=',
    '>',
    '<'
  }
  local p = lookupify{
    'and',
    'break',
    'do',
    'else',
    'elseif',
    'end',
    'false',
    'for',
    'function',
    'goto',
    'if',
    'in',
    'local',
    'nil',
    'not',
    'or',
    'repeat',
    'return',
    'then',
    'true',
    'until',
    'while'
  }
  local i = lookupify{
    'else',
    'elseif',
    'until',
    'end'
  }
  local h = lookupify{
    '-',
    'not',
    '#'
  }
  local j = lookupify{
    '+',
    '-',
    '*',
    '/',
    '%',
    '^',
    '#',
    '..',
    '.',
    ':',
    '>',
    '<',
    '<=',
    '>=',
    '~=',
    '==',
    'and',
    'or'
  }
  local a = lookupify{}
  local l = {
    ['+'] = {
      6,
      6
    };
    ['-'] = {
      6,
      6
    };
    ['*'] = {
      7,
      7
    };
    ['/'] = {
      7,
      7
    };
    ['%'] = {
      7,
      7
    };
    ['^'] = {
      10,
      9
    };
    ['..'] = {
      5,
      4
    };
    ['=='] = {
      3,
      3
    };
    ['~='] = {
      3,
      3
    };
    ['>'] = {
      3,
      3
    };
    ['<'] = {
      3,
      3
    };
    ['>='] = {
      3,
      3
    };
    ['<='] = {
      3,
      3
    };
    ['and'] = {
      2,
      2
    };
    ['or'] = {
      1,
      1
    }
  }
  local e = 8
  function CreateLuaTokenStream(q)
    local u = 1
    local a = #q
    local h = {}
    local function t(b)
      b = b or 0
      if u <= a then
        return q:sub(u + b, u + b)
      else
        return ''
      end
    end
    local function r()
      if u <= a then
        local a = q:sub(u, u)
        u = u + 1
        return a
      else
        return ''
      end
    end
    local b = error
    local function i(a)
      local e = 1
      local c = 1
      local d = 1
      while e <= u do
        if q:sub(e, e) == '\n' then
          c = c + 1
          d = 1
        else
          d = d + 1
        end
        e = e + 1
      end
      for a, a in pairs(h) do
        print(a.Type.."<"..a.Source..">")
      end
      b("file<"..c..":"..d..">: "..a)
    end
    local function e(a)
      while true do
        local b = r()
        if b == '' then
          i("Unfinished long string.")
        elseif b == ']' then
          local b = true
          for a = 1, a do
            if t() == '=' then
              u = u + 1
            else
              b = false
              break
            end
          end
          if b and r() == ']' then
            return
          end
        end
      end
    end
    local function b()
      local a = u
      while t() == '=' do
        u = u + 1
      end
      if t() == '[' then
        u = u + 1
        return u - a - 1
      else
        u = a
        return nil
      end
    end
    local j = 1
    local l = 1
    local function s(a)
      local a = {
        Type = a;
        LeadingWhite = q:sub(j, l - 1);
        Source = q:sub(l, u - 1)
      }
      table.insert(h, a)
      j = u
      l = u
      return a
    end
    while true do
      j = u
      while true do
        local a = t()
        if a == '' then
          break
        elseif a == '-' then
          if t(1) == '-' then
            u = u + 2
            if t() == '[' then
              u = u + 1
              local a = b()
              if a then
                e(a)
              else
                while true do
                  local a = r()
                  if a == '' or a == '\n' then
                    break
                  end
                end
              end
            else
              while true do
                local a = r()
                if a == '' or a == '\n' then
                  break
                end
              end
            end
          else
            break
          end
        elseif m[a] then
          u = u + 1
        else
          break
        end
      end
      local a = q:sub(j, u - 1)
      l = u
      local h = r()
      if h == '' then
        s('Eof')
        break
      elseif h == '\'' or h == '\"' then
        while true do
          local a = r()
          if a == '\\' then
            local b = r()
            local a = k[b]
          elseif a == h then
            break
          end
        end
        s('String')
      elseif f[h] then
        while n[t()] do
          u = u + 1
        end
        if p[q:sub(l, u - 1)] then
          s('Keyword')
        else
          s('Ident')
        end
      elseif o[h] or (h == '.' and o[t()]) then
        if h == '0' and t() == 'x' then
          u = u + 1
          while d[t()] do
            u = u + 1
          end
        else
          while o[t()] do
            u = u + 1
          end
          if t() == '.' then
            u = u + 1
            while o[t()] do
              u = u + 1
            end
          end
          if t() == 'e' or t() == 'E' then
            u = u + 1
            if t() == '-' then
              u = u + 1
            end
            while o[t()] do
              u = u + 1
            end
          end
        end
        s('Number')
      elseif h == '[' then
        local a = b()
        if a then
          e(a)
          s('String')
        else
          s('Symbol')
        end
      elseif h == '.' then
        if t() == '.' then
          r()
          if t() == '.' then
            r()
          end
        end
        s('Symbol')
      elseif g[h] then
        if t() == '=' then
          u = u + 1
        end
        s('Symbol')
      elseif c[h] then
        s('Symbol')
      else
        i("Bad symbol `"..h.."` in source.")
      end
    end
    return h
  end
  function CreateLuaParser(a)
    local f = CreateLuaTokenStream(a)
    local b = 1
    local function u()
      local a = f[b]
      if b < #f then
        b = b + 1
      end
      return a
    end
    local function t(a)
      a = b + (a or 0)
      return f[a] or f[#f]
    end
    local function q(a)
      local b = 1
      local d = 0
      local c = 1
      while true do
        local f = f[c]
        local e
        if f == a then
          e = f.LeadingWhite
        else
          e = f.LeadingWhite..f.Source
        end
        for a = 1, #e do
          local a = e:sub(a, a)
          if a == '\n' then
            b = b + 1
            d = 0
          else
            d = d + 1
          end
        end
        if f == a then
          break
        end
        c = c + 1
      end
      return b..":"..(d + 1)
    end
    local function b()
      local a = t()
      return "<"..a.Type.." `"..a.Source.."`> at: "..q(a)
    end
    local function k()
      local a = t()
      return a.Type == 'Eof' or (a.Type == 'Keyword' and i[a.Source])
    end
    local function c()
      return h[t().Source] or false
    end
    local function d()
      return j[t().Source] or false
    end
    local function r(a, c)
      local b = t()
      if b.Type == a and (c == nil or b.Source == c) then
        return u()
      else
        for a = -3, 3 do
          print("Tokens["..a.."] = `"..t(a).Source.."`")
        end
        if c then
          error(q(b)..": `"..c.."` expected.")
        else
          error(q(b)..": "..a.." expected.")
        end
      end
    end
    local function s(c)
      local b = c.GetFirstToken
      local a = c.GetLastToken
      function c:GetFirstToken()
        local a = b(self)
        assert(a)
        return a
      end
      function c:GetLastToken()
        local a = a(self)
        assert(a)
        return a
      end
      return c
    end
    local o
    local h
    local function n()
      local b = {}
      local a = {}
      table.insert(b, h())
      while t().Source == ',' do
        table.insert(a, u())
        table.insert(b, h())
      end
      return b, a
    end
    local function a()
      local a = t()
      if a.Source == '(' then
        local c = u()
        local a = h()
        local b = r('Symbol', ')')
        return s{
          Type = 'ParenExpr';
          Expression = a;
          Token_OpenParen = c;
          Token_CloseParen = b;
          GetFirstToken = function(a)
            return a.Token_OpenParen
          end;
          GetLastToken = function(a)
            return a.Token_CloseParen
          end
        }
      elseif a.Type == 'Ident' then
        return s{
          Type = 'VariableExpr';
          Token = u();
          GetFirstToken = function(a)
            return a.Token
          end;
          GetLastToken = function(a)
            return a.Token
          end
        }
      else
        print(b())
        error(q(a)..": Unexpected symbol")
      end
    end
    function tableexpr()
      local b = r('Symbol', '{')
      local f = {}
      local c = {}
      while t().Source ~= '}' do
        if t().Source == '[' then
          local b = u()
          local a = h()
          local d = r('Symbol', ']')
          local c = r('Symbol', '=')
          local e = h()
          table.insert(f, {
            EntryType = 'Index';
            Index = a;
            Value = e;
            Token_OpenBracket = b;
            Token_CloseBracket = d;
            Token_Equals = c
          })
        elseif t().Type == 'Ident' and t(1).Source == '=' then
          local c = u()
          local a = u()
          local b = h()
          table.insert(f, {
            EntryType = 'Field';
            Field = c;
            Value = b;
            Token_Equals = a
          })
        else
          local a = h()
          table.insert(f, {
            EntryType = 'Value';
            Value = a
          })
        end
        if t().Source == ',' or t().Source == ';' then
          table.insert(c, u())
        else
          break
        end
      end
      local a = r('Symbol', '}')
      return s{
        Type = 'TableLiteral';
        EntryList = f;
        Token_SeparatorList = c;
        Token_OpenBrace = b;
        Token_CloseBrace = a;
        GetFirstToken = function(a)
          return a.Token_OpenBrace
        end;
        GetLastToken = function(a)
          return a.Token_CloseBrace
        end
      }
    end
    local function j(a)
      local c = {}
      local b = {}
      if t().Type == 'Ident' then
        table.insert(c, u())
      elseif t().Source == '...' and a then
        return c, b, u()
      end
      while t().Source == ',' do
        table.insert(b, u())
        if t().Source == '...' and a then
          return c, b, u()
        else
          local a = r('Ident')
          table.insert(c, a)
        end
      end
      return c, b
    end
    local function p(b)
      local a = o()
      local c = t()
      if c.Type == 'Keyword' and c.Source == b then
        u()
        return a, c
      else
        print(c.Type, c.Source)
        error(q(c)..": "..b.." expected.")
      end
    end
    local function m(i)
      local a = u()
      local l
      local k
      if not i then
        l = {}
        k = {}
        table.insert(l, r('Ident'))
        while t().Source == '.' do
          table.insert(k, u())
          table.insert(l, r('Ident'))
        end
        if t().Source == ':' then
          table.insert(k, u())
          table.insert(l, r('Ident'))
        end
      end
      local d = r('Symbol', '(')
      local c, f, h = j(true)
      local g = r('Symbol', ')')
      local b, e = p('end')
      return s{
        Type = (i and 'FunctionLiteral' or 'FunctionStat');
        NameChain = l;
        ArgList = c;
        Body = b;
        Token_Function = a;
        Token_NameChainSeparator = k;
        Token_OpenParen = d;
        Token_Varg = h;
        Token_ArgCommaList = f;
        Token_CloseParen = g;
        Token_End = e;
        GetFirstToken = function(a)
          return a.Token_Function
        end;
        GetLastToken = function(a)
          return a.Token_End
        end
      }
    end
    local function f()
      local a = t()
      if a.Source == '(' then
        local a = u()
        local c = {}
        local d = {}
        while t().Source ~= ')' do
          table.insert(c, h())
          if t().Source == ',' then
            table.insert(d, u())
          else
            break
          end
        end
        local b = r('Symbol', ')')
        return s{
          CallType = 'ArgCall';
          ArgList = c;
          Token_CommaList = d;
          Token_OpenParen = a;
          Token_CloseParen = b;
          GetFirstToken = function(a)
            return a.Token_OpenParen
          end;
          GetLastToken = function(a)
            return a.Token_CloseParen
          end
        }
      elseif a.Source == '{' then
        return s{
          CallType = 'TableCall';
          TableExpr = h();
          GetFirstToken = function(a)
            return a.TableExpr:GetFirstToken()
          end;
          GetLastToken = function(a)
            return a.TableExpr:GetLastToken()
          end
        }
      elseif a.Type == 'String' then
        return s{
          CallType = 'StringCall';
          Token = u();
          GetFirstToken = function(a)
            return a.Token
          end;
          GetLastToken = function(a)
            return a.Token
          end
        }
      else
        error("Function arguments expected.")
      end
    end
    local function g()
      local d = a()
      assert(d, "nil prefixexpr")
      while true do
        local a = t()
        if a.Source == '.' then
          local b = u()
          local a = r('Ident')
          d = s{
            Type = 'FieldExpr';
            Base = d;
            Field = a;
            Token_Dot = b;
            GetFirstToken = function(a)
              return a.Base:GetFirstToken()
            end;
            GetLastToken = function(a)
              return a.Field
            end
          }
        elseif a.Source == ':' then
          local b = u()
          local a = r('Ident')
          local c = f()
          d = s{
            Type = 'MethodExpr';
            Base = d;
            Method = a;
            FunctionArguments = c;
            Token_Colon = b;
            GetFirstToken = function(a)
              return a.Base:GetFirstToken()
            end;
            GetLastToken = function(a)
              return a.FunctionArguments:GetLastToken()
            end
          }
        elseif a.Source == '[' then
          local b = u()
          local a = h()
          local c = r('Symbol', ']')
          d = s{
            Type = 'IndexExpr';
            Base = d;
            Index = a;
            Token_OpenBracket = b;
            Token_CloseBracket = c;
            GetFirstToken = function(a)
              return a.Base:GetFirstToken()
            end;
            GetLastToken = function(a)
              return a.Token_CloseBracket
            end
          }
        elseif a.Source == '{' or a.Source == '(' or a.Type == 'String' then
          d = s{
            Type = 'CallExpr';
            Base = d;
            FunctionArguments = f();
            GetFirstToken = function(a)
              return a.Base:GetFirstToken()
            end;
            GetLastToken = function(a)
              return a.FunctionArguments:GetLastToken()
            end
          }
        else
          return d
        end
      end
    end
    local function a()
      local a = t()
      if a.Type == 'Number' then
        return s{
          Type = 'NumberLiteral';
          Token = u();
          GetFirstToken = function(a)
            return a.Token
          end;
          GetLastToken = function(a)
            return a.Token
          end
        }
      elseif a.Type == 'String' then
        return s{
          Type = 'StringLiteral';
          Token = u();
          GetFirstToken = function(a)
            return a.Token
          end;
          GetLastToken = function(a)
            return a.Token
          end
        }
      elseif a.Source == 'nil' then
        return s{
          Type = 'NilLiteral';
          Token = u();
          GetFirstToken = function(a)
            return a.Token
          end;
          GetLastToken = function(a)
            return a.Token
          end
        }
      elseif a.Source == 'true' or a.Source == 'false' then
        return s{
          Type = 'BooleanLiteral';
          Token = u();
          GetFirstToken = function(a)
            return a.Token
          end;
          GetLastToken = function(a)
            return a.Token
          end
        }
      elseif a.Source == '...' then
        return s{
          Type = 'VargLiteral';
          Token = u();
          GetFirstToken = function(a)
            return a.Token
          end;
          GetLastToken = function(a)
            return a.Token
          end
        }
      elseif a.Source == '{' then
        return tableexpr()
      elseif a.Source == 'function' then
        return m(true)
      else
        return g()
      end
    end
    local function f(b)
      local g
      if c() then
        local a = u()
        local b = f(e)
        g = s{
          Type = 'UnopExpr';
          Token_Op = a;
          Rhs = b;
          GetFirstToken = function(a)
            return a.Token_Op
          end;
          GetLastToken = function(a)
            return a.Rhs:GetLastToken()
          end
        }
      else
        g = a()
        assert(g, "nil simpleexpr")
      end
      while d() and l[t().Source][1] > b do
        local a = u()
        local b = f(l[a.Source][2])
        assert(b, "RhsNeeded")
        g = s{
          Type = 'BinopExpr';
          Lhs = g;
          Rhs = b;
          Token_Op = a;
          GetFirstToken = function(a)
            return a.Lhs:GetFirstToken()
          end;
          GetLastToken = function(a)
            return a.Rhs:GetLastToken()
          end
        }
      end
      return g
    end
    h = function()
      return f(0)
    end
    local function b()
      local a = g()
      if a.Type == 'MethodExpr' or a.Type == 'CallExpr' then
        return s{
          Type = 'CallExprStat';
          Expression = a;
          GetFirstToken = function(a)
            return a.Expression:GetFirstToken()
          end;
          GetLastToken = function(a)
            return a.Expression:GetLastToken()
          end
        }
      else
        local d = {
          a
        }
        local b = {}
        while t().Source == ',' do
          table.insert(b, u())
          local a = g()
          if a.Type == 'MethodExpr' or a.Type == 'CallExpr' then
            error("Bad left hand side of assignment")
          end
          table.insert(d, a)
        end
        local a = r('Symbol', '=')
        local c = {
          h()
        }
        local e = {}
        while t().Source == ',' do
          table.insert(e, u())
          table.insert(c, h())
        end
        return s{
          Type = 'AssignmentStat';
          Rhs = c;
          Lhs = d;
          Token_Equals = a;
          Token_LhsSeparatorList = b;
          Token_RhsSeparatorList = e;
          GetFirstToken = function(a)
            return a.Lhs[1]:GetFirstToken()
          end;
          GetLastToken = function(a)
            return a.Rhs[#a.Rhs]:GetLastToken()
          end
        }
      end
    end
    local function a()
      local c = u()
      local d = h()
      local e = r('Keyword', 'then')
      local a = o()
      local f = {}
      while t().Source == 'elseif' or t().Source == 'else' do
        local d = u()
        local b, c
        if d.Source == 'elseif' then
          b = h()
          c = r('Keyword', 'then')
        end
        local a = o()
        table.insert(f, {
          Condition = b;
          Body = a;
          ClauseType = d.Source;
          Token = d;
          Token_Then = c
        })
        if d.Source == 'else' then
          break
        end
      end
      local b = r('Keyword', 'end')
      return s{
        Type = 'IfStat';
        Condition = d;
        Body = a;
        ElseClauseList = f;
        Token_If = c;
        Token_Then = e;
        Token_End = b;
        GetFirstToken = function(a)
          return a.Token_If
        end;
        GetLastToken = function(a)
          return a.Token_End
        end
      }
    end
    local function c()
      local c = u()
      local a, b = p('end')
      return s{
        Type = 'DoStat';
        Body = a;
        Token_Do = c;
        Token_End = b;
        GetFirstToken = function(a)
          return a.Token_Do
        end;
        GetLastToken = function(a)
          return a.Token_End
        end
      }
    end
    local function e()
      local d = u()
      local c = h()
      local a = r('Keyword', 'do')
      local b, e = p('end')
      return s{
        Type = 'WhileStat';
        Condition = c;
        Body = b;
        Token_While = d;
        Token_Do = a;
        Token_End = e;
        GetFirstToken = function(a)
          return a.Token_While
        end;
        GetLastToken = function(a)
          return a.Token_End
        end
      }
    end
    local function d()
      local i = u()
      local g, h = j()
      local a = {}
      if t().Source == '=' then
        local e = u()
        local f, d = n()
        if #f < 2 or #f > 3 then
          error("expected 2 or 3 values for range bounds")
        end
        local b = r('Keyword', 'do')
        local c, a = p('end')
        return s{
          Type = 'NumericForStat';
          VarList = g;
          RangeList = f;
          Body = c;
          Token_For = i;
          Token_VarCommaList = h;
          Token_Equals = e;
          Token_RangeCommaList = d;
          Token_Do = b;
          Token_End = a;
          GetFirstToken = function(a)
            return a.Token_For
          end;
          GetLastToken = function(a)
            return a.Token_End
          end
        }
      elseif t().Source == 'in' then
        local c = u()
        local a, b = n()
        local d = r('Keyword', 'do')
        local f, e = p('end')
        return s{
          Type = 'GenericForStat';
          VarList = g;
          GeneratorList = a;
          Body = f;
          Token_For = i;
          Token_VarCommaList = h;
          Token_In = c;
          Token_GeneratorCommaList = b;
          Token_Do = d;
          Token_End = e;
          GetFirstToken = function(a)
            return a.Token_For
          end;
          GetLastToken = function(a)
            return a.Token_End
          end
        }
      else
        error("`=` or in expected")
      end
    end
    local function f()
      local a = u()
      local b, d = p('until')
      local c = h()
      return s{
        Type = 'RepeatStat';
        Body = b;
        Condition = c;
        Token_Repeat = a;
        Token_Until = d;
        GetFirstToken = function(a)
          return a.Token_Repeat
        end;
        GetLastToken = function(a)
          return a.Condition:GetLastToken()
        end
      }
    end
    local function h()
      local e = u()
      if t().Source == 'function' then
        local a = m(false)
        if #a.NameChain > 1 then
          error(q(a.Token_NameChainSeparator[1])..": `(` expected.")
        end
        return s{
          Type = 'LocalFunctionStat';
          FunctionStat = a;
          Token_Local = e;
          GetFirstToken = function(a)
            return a.Token_Local
          end;
          GetLastToken = function(a)
            return a.FunctionStat:GetLastToken()
          end
        }
      elseif t().Type == 'Ident' then
        local a, b = j()
        local c, d = {}, {}
        local f
        if t().Source == '=' then
          f = u()
          c, d = n()
        end
        return s{
          Type = 'LocalVarStat';
          VarList = a;
          ExprList = c;
          Token_Local = e;
          Token_Equals = f;
          Token_VarCommaList = b;
          Token_ExprCommaList = d;
          GetFirstToken = function(a)
            return a.Token_Local
          end;
          GetLastToken = function(a)
            if #a.ExprList > 0 then
              return a.ExprList[#a.ExprList]:GetLastToken()
            else
              return a.VarList[#a.VarList]
            end
          end
        }
      else
        error("`function` or ident expected")
      end
    end
    local function g()
      local a = u()
      local b
      local c
      if k() or t().Source == ';' then
        b = {}
        c = {}
      else
        b, c = n()
      end
      return {
        Type = 'ReturnStat';
        ExprList = b;
        Token_Return = a;
        Token_CommaList = c;
        GetFirstToken = function(a)
          return a.Token_Return
        end;
        GetLastToken = function(a)
          if #a.ExprList > 0 then
            return a.ExprList[#a.ExprList]:GetLastToken()
          else
            return a.Token_Return
          end
        end
      }
    end
    local function j()
      local a = u()
      return {
        Type = 'BreakStat';
        Token_Break = a;
        GetFirstToken = function(a)
          return a.Token_Break
        end;
        GetLastToken = function(a)
          return a.Token_Break
        end
      }
    end
    local function i()
      local i = t()
      if i.Source == 'if' then
        return false, a()
      elseif i.Source == 'while' then
        return false, e()
      elseif i.Source == 'do' then
        return false, c()
      elseif i.Source == 'for' then
        return false, d()
      elseif i.Source == 'repeat' then
        return false, f()
      elseif i.Source == 'function' then
        return false, m(false)
      elseif i.Source == 'local' then
        return false, h()
      elseif i.Source == 'return' then
        return true, g()
      elseif i.Source == 'break' then
        return true, j()
      else
        return false, b()
      end
    end
    o = function()
      local d = {}
      local a = {}
      local c = false
      while not c and not k() do
        local b
        c, b = i()
        table.insert(d, b)
        local b = t()
        if b.Type == 'Symbol' and b.Source == ';' then
          a[#d] = u()
        end
      end
      return {
        Type = 'StatList';
        StatementList = d;
        SemicolonList = a;
        GetFirstToken = function(a)
          if #a.StatementList == 0 then
            return nil
          else
            return a.StatementList[1]:GetFirstToken()
          end
        end;
        GetLastToken = function(a)
          if #a.StatementList == 0 then
            return nil
          elseif a.SemicolonList[#a.StatementList] then
            return a.SemicolonList[#a.StatementList]
          else
            return a.StatementList[#a.StatementList]:GetLastToken()
          end
        end
      }
    end
    return o()
  end
  function VisitAst(e, d)
    local b = lookupify{
      'BinopExpr';
      'UnopExpr';
      'NumberLiteral';
      'StringLiteral';
      'NilLiteral';
      'BooleanLiteral';
      'VargLiteral';
      'FieldExpr';
      'IndexExpr';
      'MethodExpr';
      'CallExpr';
      'FunctionLiteral';
      'VariableExpr';
      'ParenExpr';
      'TableLiteral'
    }
    local c = lookupify{
      'StatList';
      'BreakStat';
      'ReturnStat';
      'LocalVarStat';
      'LocalFunctionStat';
      'FunctionStat';
      'RepeatStat';
      'GenericForStat';
      'NumericForStat';
      'WhileStat';
      'DoStat';
      'IfStat';
      'CallExprStat';
      'AssignmentStat'
    }
    for d, a in pairs(d) do
      if not c[d] and not b[d] then
        error("Invalid visitor target: `"..d.."`")
      end
    end
    local function b(a)
      local b = d[a.Type]
      if type(b) == 'function' then
        return b(a)
      elseif b and b.Pre then
        return b.Pre(a)
      end
    end
    local function a(a)
      local b = d[a.Type]
      if b and type(b) == 'table' and b.Post then
        return b.Post(a)
      end
    end
    local f, d
    f = function(c)
      if b(c) then
        return
      end
      if c.Type == 'BinopExpr' then
        f(c.Lhs)
        f(c.Rhs)
      elseif c.Type == 'UnopExpr' then
        f(c.Rhs)
      elseif c.Type == 'NumberLiteral' or c.Type == 'StringLiteral' or c.Type == 'NilLiteral' or c.Type == 'BooleanLiteral' or c.Type == 'VargLiteral' then
      elseif c.Type == 'FieldExpr' then
        f(c.Base)
      elseif c.Type == 'IndexExpr' then
        f(c.Base)
        f(c.Index)
      elseif c.Type == 'MethodExpr' or c.Type == 'CallExpr' then
        f(c.Base)
        if c.FunctionArguments.CallType == 'ArgCall' then
          for a, a in pairs(c.FunctionArguments.ArgList) do
            f(a)
          end
        elseif c.FunctionArguments.CallType == 'TableCall' then
          f(c.FunctionArguments.TableExpr)
        end
      elseif c.Type == 'FunctionLiteral' then
        d(c.Body)
      elseif c.Type == 'VariableExpr' then
      elseif c.Type == 'ParenExpr' then
        f(c.Expression)
      elseif c.Type == 'TableLiteral' then
        for a, a in pairs(c.EntryList) do
          if a.EntryType == 'Field' then
            f(a.Value)
          elseif a.EntryType == 'Index' then
            f(a.Index)
            f(a.Value)
          elseif a.EntryType == 'Value' then
            f(a.Value)
          else
            assert(false, "unreachable")
          end
        end
      else
        assert(false, "unreachable, type: "..c.Type..":"..FormatTable(c))
      end
      a(c)
    end
    d = function(c)
      if b(c) then
        return
      end
      if c.Type == 'StatList' then
        for a, a in pairs(c.StatementList) do
          d(a)
        end
      elseif c.Type == 'BreakStat' then
      elseif c.Type == 'ReturnStat' then
        for a, a in pairs(c.ExprList) do
          f(a)
        end
      elseif c.Type == 'LocalVarStat' then
        if c.Token_Equals then
          for a, a in pairs(c.ExprList) do
            f(a)
          end
        end
      elseif c.Type == 'LocalFunctionStat' then
        d(c.FunctionStat.Body)
      elseif c.Type == 'FunctionStat' then
        d(c.Body)
      elseif c.Type == 'RepeatStat' then
        d(c.Body)
        f(c.Condition)
      elseif c.Type == 'GenericForStat' then
        for a, a in pairs(c.GeneratorList) do
          f(a)
        end
        d(c.Body)
      elseif c.Type == 'NumericForStat' then
        for a, a in pairs(c.RangeList) do
          f(a)
        end
        d(c.Body)
      elseif c.Type == 'WhileStat' then
        f(c.Condition)
        d(c.Body)
      elseif c.Type == 'DoStat' then
        d(c.Body)
      elseif c.Type == 'IfStat' then
        f(c.Condition)
        d(c.Body)
        for a, a in pairs(c.ElseClauseList) do
          if a.Condition then
            f(a.Condition)
          end
          d(a.Body)
        end
      elseif c.Type == 'CallExprStat' then
        f(c.Expression)
      elseif c.Type == 'AssignmentStat' then
        for a, a in pairs(c.Lhs) do
          f(a)
        end
        for a, a in pairs(c.Rhs) do
          f(a)
        end
      else
        assert(false, "unreachable")
      end
      a(c)
    end
    if c[e.Type] then
      d(e)
    else
      f(e)
    end
  end
  function AddVariableInfo(a)
    local e = {}
    local j = nil
    local b = 0
    local function i()
      b = b + 1
      return b
    end
    local function f()
      j = {
        ParentScope = j;
        ChildScopeList = {};
        VariableList = {};
        BeginLocation = i()
      }
      if j.ParentScope then
        j.Depth = j.ParentScope.Depth + 1
        table.insert(j.ParentScope.ChildScopeList, j)
      else
        j.Depth = 1
      end
      function j:GetVar(b)
        for a, a in pairs(self.VariableList) do
          if a.Name == b then
            return a
          end
        end
        if self.ParentScope then
          return self.ParentScope:GetVar(b)
        else
          for a, a in pairs(e) do
            if a.Name == b then
              return a
            end
          end
        end
      end
    end
    local function h()
      local b = j
      b.EndLocation = i()
      for a, a in pairs(b.VariableList) do
        a.ScopeEndLocation = b.EndLocation
      end
      j = b.ParentScope
      return b
    end
    f()
    local function g(b, a, c)
      assert(c, "Misisng localInfo")
      assert(b, "Missing local var name")
      local a = {
        Type = 'Local';
        Name = b;
        RenameList = {
          a
        };
        AssignedTo = false;
        Info = c;
        UseCount = 0;
        Scope = j;
        BeginLocation = i();
        EndLocation = i();
        ReferenceLocationList = {
          i()
        }
      }
      function a:Rename(b)
        self.Name = b
        for a, a in pairs(self.RenameList) do
          a(b)
        end
      end
      function a:Reference()
        self.UseCount = self.UseCount + 1
      end
      table.insert(j.VariableList, a)
      return a
    end
    local function b(b)
      for a, a in pairs(e) do
        if a.Name == b then
          return a
        end
      end
      local a = {
        Type = 'Global';
        Name = b;
        RenameList = {};
        AssignedTo = false;
        UseCount = 0;
        Scope = nil;
        BeginLocation = i();
        EndLocation = i();
        ReferenceLocationList = {}
      }
      function a:Rename(b)
        self.Name = b
        for a, a in pairs(self.RenameList) do
          a(b)
        end
      end
      function a:Reference()
        self.UseCount = self.UseCount + 1
      end
      table.insert(e, a)
      return a
    end
    local function c(c, a)
      assert(c, "Missing var name")
      local b = b(c)
      table.insert(b.RenameList, a)
      return b
    end
    local function d(c, b)
      for a = #c.VariableList, 1, -1 do
        if c.VariableList[a].Name == b then
          return c.VariableList[a]
        end
      end
      if c.ParentScope then
        local a = d(c.ParentScope, b)
        if a then
          return a
        end
      end
      return nil
    end
    local function b(b, a)
      assert(b, "Missing var name")
      local d = d(j, b)
      if d then
        table.insert(d.RenameList, a)
      else
        d = c(b, a)
      end
      local a = i()
      d.EndLocation = a
      table.insert(d.ReferenceLocationList, d.EndLocation)
      return d
    end
    local i = {}
    i.FunctionLiteral = {
      Pre = function(a)
        f()
        for a, b in pairs(a.ArgList) do
          local a = g(b.Source, function(a)
            b.Source = a
          end, {
            Type = 'Argument';
            Index = a
          })
        end
      end;
      Post = function(a)
        h()
      end
    }
    i.VariableExpr = function(c)
      c.Variable = b(c.Token.Source, function(a)
        c.Token.Source = a
      end)
    end
    i.StatList = {
      Pre = function(a)
        f()
      end;
      Post = function(a)
        if not a.SkipPop then
          h()
        end
      end
    }
    i.LocalVarStat = {
      Post = function(c)
        for a, b in pairs(c.VarList) do
          g(b.Source, function(b)
            c.VarList[a].Source = b
          end, {
            Type = 'Local'
          })
        end
      end
    }
    i.LocalFunctionStat = {
      Pre = function(b)
        g(b.FunctionStat.NameChain[1].Source, function(a)
          b.FunctionStat.NameChain[1].Source = a
        end, {
          Type = 'LocalFunction'
        })
        f()
        for a, b in pairs(b.FunctionStat.ArgList) do
          g(b.Source, function(a)
            b.Source = a
          end, {
            Type = 'Argument';
            Index = a
          })
        end
      end;
      Post = function()
        h()
      end
    }
    i.FunctionStat = {
      Pre = function(a)
        local h = a.NameChain
        local e
        if #h == 1 then
          if d(j, h[1].Source) then
            e = b(h[1].Source, function(a)
              h[1].Source = a
            end)
          else
            e = c(h[1].Source, function(a)
              h[1].Source = a
            end)
          end
        else
          e = b(h[1].Source, function(a)
            h[1].Source = a
          end)
        end
        e.AssignedTo = true
        f()
        for a, b in pairs(a.ArgList) do
          g(b.Source, function(a)
            b.Source = a
          end, {
            Type = 'Argument';
            Index = a
          })
        end
      end;
      Post = function()
        h()
      end
    }
    i.GenericForStat = {
      Pre = function(a)
        for a, a in pairs(a.GeneratorList) do
          VisitAst(a, i)
        end
        f()
        for a, b in pairs(a.VarList) do
          g(b.Source, function(a)
            b.Source = a
          end, {
            Type = 'ForRange';
            Index = a
          })
        end
        VisitAst(a.Body, i)
        h()
        return true
      end
    }
    i.NumericForStat = {
      Pre = function(a)
        for a, a in pairs(a.RangeList) do
          VisitAst(a, i)
        end
        f()
        for a, b in pairs(a.VarList) do
          g(b.Source, function(a)
            b.Source = a
          end, {
            Type = 'ForRange';
            Index = a
          })
        end
        VisitAst(a.Body, i)
        h()
        return true
      end
    }
    i.RepeatStat = {
      Pre = function(a)
        a.Body.SkipPop = true
      end;
      Post = function(a)
        h()
      end
    }
    i.AssignmentStat = {
      Post = function(a)
        for a, a in pairs(a.Lhs) do
          if a.Variable then
            a.Variable.AssignedTo = true
          end
        end
      end
    }
    VisitAst(a, i)
    return e, h()
  end
  function PrintAst(a)
    local c, d
    local b = ''
    local function f(a)
      if not a.LeadingWhite or not a.Source then
        error("Bad token: "..FormatTable(a))
      end
      b = b..a.LeadingWhite..a.Source
    end
    d = function(e)
      if e.Type == 'BinopExpr' then
        d(e.Lhs)
        f(e.Token_Op)
        d(e.Rhs)
      elseif e.Type == 'UnopExpr' then
        f(e.Token_Op)
        d(e.Rhs)
      elseif e.Type == 'NumberLiteral' or e.Type == 'StringLiteral' or e.Type == 'NilLiteral' or e.Type == 'BooleanLiteral' or e.Type == 'VargLiteral' then
        f(e.Token)
      elseif e.Type == 'FieldExpr' then
        d(e.Base)
        f(e.Token_Dot)
        f(e.Field)
      elseif e.Type == 'IndexExpr' then
        d(e.Base)
        f(e.Token_OpenBracket)
        d(e.Index)
        f(e.Token_CloseBracket)
      elseif e.Type == 'MethodExpr' or e.Type == 'CallExpr' then
        d(e.Base)
        if e.Type == 'MethodExpr' then
          f(e.Token_Colon)
          f(e.Method)
        end
        if e.FunctionArguments.CallType == 'StringCall' then
          f(e.FunctionArguments.Token)
        elseif e.FunctionArguments.CallType == 'ArgCall' then
          f(e.FunctionArguments.Token_OpenParen)
          for a, b in pairs(e.FunctionArguments.ArgList) do
            d(b)
            local a = e.FunctionArguments.Token_CommaList[a]
            if a then
              f(a)
            end
          end
          f(e.FunctionArguments.Token_CloseParen)
        elseif e.FunctionArguments.CallType == 'TableCall' then
          d(e.FunctionArguments.TableExpr)
        end
      elseif e.Type == 'FunctionLiteral' then
        f(e.Token_Function)
        f(e.Token_OpenParen)
        for b, a in pairs(e.ArgList) do
          f(a)
          local a = e.Token_ArgCommaList[b]
          if a then
            f(a)
          end
        end
        if e.Token_Varg then
          f(e.Token_Varg)
        end
        f(e.Token_CloseParen)
        c(e.Body)
        f(e.Token_End)
      elseif e.Type == 'VariableExpr' then
        f(e.Token)
      elseif e.Type == 'ParenExpr' then
        f(e.Token_OpenParen)
        d(e.Expression)
        f(e.Token_CloseParen)
      elseif e.Type == 'TableLiteral' then
        f(e.Token_OpenBrace)
        for a, b in pairs(e.EntryList) do
          if b.EntryType == 'Field' then
            f(b.Field)
            f(b.Token_Equals)
            d(b.Value)
          elseif b.EntryType == 'Index' then
            f(b.Token_OpenBracket)
            d(b.Index)
            f(b.Token_CloseBracket)
            f(b.Token_Equals)
            d(b.Value)
          elseif b.EntryType == 'Value' then
            d(b.Value)
          else
            assert(false, "unreachable")
          end
          local a = e.Token_SeparatorList[a]
          if a then
            f(a)
          end
        end
        f(e.Token_CloseBrace)
      else
        assert(false, "unreachable, type: "..e.Type..":"..FormatTable(e))
      end
    end
    c = function(e)
      if e.Type == 'StatList' then
        for b, a in pairs(e.StatementList) do
          c(a)
          if e.SemicolonList[b] then
            f(e.SemicolonList[b])
          end
        end
      elseif e.Type == 'BreakStat' then
        f(e.Token_Break)
      elseif e.Type == 'ReturnStat' then
        f(e.Token_Return)
        for b, a in pairs(e.ExprList) do
          d(a)
          if e.Token_CommaList[b] then
            f(e.Token_CommaList[b])
          end
        end
      elseif e.Type == 'LocalVarStat' then
        f(e.Token_Local)
        for a, b in pairs(e.VarList) do
          f(b)
          local a = e.Token_VarCommaList[a]
          if a then
            f(a)
          end
        end
        if e.Token_Equals then
          f(e.Token_Equals)
          for b, a in pairs(e.ExprList) do
            d(a)
            local a = e.Token_ExprCommaList[b]
            if a then
              f(a)
            end
          end
        end
      elseif e.Type == 'LocalFunctionStat' then
        f(e.Token_Local)
        f(e.FunctionStat.Token_Function)
        f(e.FunctionStat.NameChain[1])
        f(e.FunctionStat.Token_OpenParen)
        for a, b in pairs(e.FunctionStat.ArgList) do
          f(b)
          local a = e.FunctionStat.Token_ArgCommaList[a]
          if a then
            f(a)
          end
        end
        if e.FunctionStat.Token_Varg then
          f(e.FunctionStat.Token_Varg)
        end
        f(e.FunctionStat.Token_CloseParen)
        c(e.FunctionStat.Body)
        f(e.FunctionStat.Token_End)
      elseif e.Type == 'FunctionStat' then
        f(e.Token_Function)
        for b, a in pairs(e.NameChain) do
          f(a)
          local a = e.Token_NameChainSeparator[b]
          if a then
            f(a)
          end
        end
        f(e.Token_OpenParen)
        for b, a in pairs(e.ArgList) do
          f(a)
          local a = e.Token_ArgCommaList[b]
          if a then
            f(a)
          end
        end
        if e.Token_Varg then
          f(e.Token_Varg)
        end
        f(e.Token_CloseParen)
        c(e.Body)
        f(e.Token_End)
      elseif e.Type == 'RepeatStat' then
        f(e.Token_Repeat)
        c(e.Body)
        f(e.Token_Until)
        d(e.Condition)
      elseif e.Type == 'GenericForStat' then
        f(e.Token_For)
        for b, a in pairs(e.VarList) do
          f(a)
          local a = e.Token_VarCommaList[b]
          if a then
            f(a)
          end
        end
        f(e.Token_In)
        for b, a in pairs(e.GeneratorList) do
          d(a)
          local a = e.Token_GeneratorCommaList[b]
          if a then
            f(a)
          end
        end
        f(e.Token_Do)
        c(e.Body)
        f(e.Token_End)
      elseif e.Type == 'NumericForStat' then
        f(e.Token_For)
        for b, a in pairs(e.VarList) do
          f(a)
          local a = e.Token_VarCommaList[b]
          if a then
            f(a)
          end
        end
        f(e.Token_Equals)
        for a, b in pairs(e.RangeList) do
          d(b)
          local a = e.Token_RangeCommaList[a]
          if a then
            f(a)
          end
        end
        f(e.Token_Do)
        c(e.Body)
        f(e.Token_End)
      elseif e.Type == 'WhileStat' then
        f(e.Token_While)
        d(e.Condition)
        f(e.Token_Do)
        c(e.Body)
        f(e.Token_End)
      elseif e.Type == 'DoStat' then
        f(e.Token_Do)
        c(e.Body)
        f(e.Token_End)
      elseif e.Type == 'IfStat' then
        f(e.Token_If)
        d(e.Condition)
        f(e.Token_Then)
        c(e.Body)
        for a, a in pairs(e.ElseClauseList) do
          f(a.Token)
          if a.Condition then
            d(a.Condition)
            f(a.Token_Then)
          end
          c(a.Body)
        end
        f(e.Token_End)
      elseif e.Type == 'CallExprStat' then
        d(e.Expression)
      elseif e.Type == 'AssignmentStat' then
        for a, b in pairs(e.Lhs) do
          d(b)
          local a = e.Token_LhsSeparatorList[a]
          if a then
            f(a)
          end
        end
        f(e.Token_Equals)
        for b, a in pairs(e.Rhs) do
          d(a)
          local a = e.Token_RhsSeparatorList[b]
          if a then
            f(a)
          end
        end
      else
        assert(false, "unreachable")
      end
    end
    c(a)
    return b
  end
  local function d(b)
    local e, j
    local a = 0
    local function f(b)
      local a = '\n'..('\t'):rep(a)
      if b.LeadingWhite == '' or (b.LeadingWhite:sub(-#a, -1) ~= a) then
        b.LeadingWhite = b.LeadingWhite:gsub("\n?[\t ]*$", "")
        b.LeadingWhite = b.LeadingWhite..a
      end
    end
    local function d()
      a = a + 1
    end
    local function c()
      a = a - 1
      assert(a >= 0, "Undented too far")
    end
    local function a(a)
      if #a.LeadingWhite > 0 then
        return a.LeadingWhite:sub(1, 1)
      else
        return a.Source:sub(1, 1)
      end
    end
    local function i(b)
      if not m[a(b)] then
        b.LeadingWhite = ' '..b.LeadingWhite
      end
    end
    local function h(a)
      i(a:GetFirstToken())
    end
    local function g(a, a, b)
      d()
      e(a)
      c()
      f(b)
    end
    j = function(e)
      if e.Type == 'BinopExpr' then
        j(e.Lhs)
        j(e.Rhs)
        if e.Token_Op.Source == '..' then
        else
          h(e.Rhs)
          i(e.Token_Op)
        end
      elseif e.Type == 'UnopExpr' then
        j(e.Rhs)
      elseif e.Type == 'NumberLiteral' or e.Type == 'StringLiteral' or e.Type == 'NilLiteral' or e.Type == 'BooleanLiteral' or e.Type == 'VargLiteral' then
      elseif e.Type == 'FieldExpr' then
        j(e.Base)
      elseif e.Type == 'IndexExpr' then
        j(e.Base)
        j(e.Index)
      elseif e.Type == 'MethodExpr' or e.Type == 'CallExpr' then
        j(e.Base)
        if e.Type == 'MethodExpr' then
        end
        if e.FunctionArguments.CallType == 'StringCall' then
        elseif e.FunctionArguments.CallType == 'ArgCall' then
          for a, b in pairs(e.FunctionArguments.ArgList) do
            j(b)
            if a > 1 then
              h(b)
            end
            local a = e.FunctionArguments.Token_CommaList[a]
            if a then
            end
          end
        elseif e.FunctionArguments.CallType == 'TableCall' then
          j(e.FunctionArguments.TableExpr)
        end
      elseif e.Type == 'FunctionLiteral' then
        for b, a in pairs(e.ArgList) do
          if b > 1 then
            i(a)
          end
          local a = e.Token_ArgCommaList[b]
          if a then
          end
        end
        if #e.ArgList > 0 and e.Token_Varg then
          i(e.Token_Varg)
        end
        g(e.Token_CloseParen, e.Body, e.Token_End)
      elseif e.Type == 'VariableExpr' then
      elseif e.Type == 'ParenExpr' then
        j(e.Expression)
      elseif e.Type == 'TableLiteral' then
        if #e.EntryList == 0 then
        else
          d()
          for a, b in pairs(e.EntryList) do
            if b.EntryType == 'Field' then
              f(b.Field)
              i(b.Token_Equals)
              j(b.Value)
              h(b.Value)
            elseif b.EntryType == 'Index' then
              f(b.Token_OpenBracket)
              j(b.Index)
              i(b.Token_Equals)
              j(b.Value)
              h(b.Value)
            elseif b.EntryType == 'Value' then
              j(b.Value)
              f(b.Value:GetFirstToken())
            else
              assert(false, "unreachable")
            end
            local a = e.Token_SeparatorList[a]
            if a then
            end
          end
          c()
          f(e.Token_CloseBrace)
        end
      else
        assert(false, "unreachable, type: "..e.Type..":"..FormatTable(e))
      end
    end
    e = function(d)
      if d.Type == 'StatList' then
        for a, a in pairs(d.StatementList) do
          e(a)
          f(a:GetFirstToken())
        end
      elseif d.Type == 'BreakStat' then
      elseif d.Type == 'ReturnStat' then
        for a, b in pairs(d.ExprList) do
          j(b)
          h(b)
          if d.Token_CommaList[a] then
          end
        end
      elseif d.Type == 'LocalVarStat' then
        for a, b in pairs(d.VarList) do
          i(b)
          local a = d.Token_VarCommaList[a]
          if a then
          end
        end
        if d.Token_Equals then
          i(d.Token_Equals)
          for a, b in pairs(d.ExprList) do
            j(b)
            h(b)
            local a = d.Token_ExprCommaList[a]
            if a then
            end
          end
        end
      elseif d.Type == 'LocalFunctionStat' then
        i(d.FunctionStat.Token_Function)
        i(d.FunctionStat.NameChain[1])
        for b, a in pairs(d.FunctionStat.ArgList) do
          if b > 1 then
            i(a)
          end
          local a = d.FunctionStat.Token_ArgCommaList[b]
          if a then
          end
        end
        if #d.FunctionStat.ArgList > 0 and d.FunctionStat.Token_Varg then
          i(d.FunctionStat.Token_Varg)
        end
        g(d.FunctionStat.Token_CloseParen, d.FunctionStat.Body, d.FunctionStat.Token_End)
      elseif d.Type == 'FunctionStat' then
        for b, a in pairs(d.NameChain) do
          if b == 1 then
            i(a)
          end
          local a = d.Token_NameChainSeparator[b]
          if a then
          end
        end
        for b, a in pairs(d.ArgList) do
          if b > 1 then
            i(a)
          end
          local a = d.Token_ArgCommaList[b]
          if a then
          end
        end
        if #d.ArgList > 0 and d.Token_Varg then
          i(d.Token_Varg)
        end
        g(d.Token_CloseParen, d.Body, d.Token_End)
      elseif d.Type == 'RepeatStat' then
        g(d.Token_Repeat, d.Body, d.Token_Until)
        j(d.Condition)
        h(d.Condition)
      elseif d.Type == 'GenericForStat' then
        for b, a in pairs(d.VarList) do
          i(a)
          local a = d.Token_VarCommaList[b]
          if a then
          end
        end
        i(d.Token_In)
        for a, b in pairs(d.GeneratorList) do
          j(b)
          h(b)
          local a = d.Token_GeneratorCommaList[a]
          if a then
          end
        end
        i(d.Token_Do)
        g(d.Token_Do, d.Body, d.Token_End)
      elseif d.Type == 'NumericForStat' then
        for a, b in pairs(d.VarList) do
          i(b)
          local a = d.Token_VarCommaList[a]
          if a then
          end
        end
        i(d.Token_Equals)
        for a, b in pairs(d.RangeList) do
          j(b)
          h(b)
          local a = d.Token_RangeCommaList[a]
          if a then
          end
        end
        i(d.Token_Do)
        g(d.Token_Do, d.Body, d.Token_End)
      elseif d.Type == 'WhileStat' then
        j(d.Condition)
        h(d.Condition)
        i(d.Token_Do)
        g(d.Token_Do, d.Body, d.Token_End)
      elseif d.Type == 'DoStat' then
        g(d.Token_Do, d.Body, d.Token_End)
      elseif d.Type == 'IfStat' then
        j(d.Condition)
        h(d.Condition)
        i(d.Token_Then)
        local c = d.Token_Then
        local b = d.Body
        for a, a in pairs(d.ElseClauseList) do
          g(c, b, a.Token)
          c = a.Token
          if a.Condition then
            j(a.Condition)
            h(a.Condition)
            i(a.Token_Then)
            c = a.Token_Then
          end
          b = a.Body
        end
        g(c, b, d.Token_End)
      elseif d.Type == 'CallExprStat' then
        j(d.Expression)
      elseif d.Type == 'AssignmentStat' then
        for a, b in pairs(d.Lhs) do
          j(b)
          if a > 1 then
            h(b)
          end
          local a = d.Token_LhsSeparatorList[a]
          if a then
          end
        end
        i(d.Token_Equals)
        for a, b in pairs(d.Rhs) do
          j(b)
          h(b)
          local a = d.Token_RhsSeparatorList[a]
          if a then
          end
        end
      else
        assert(false, "unreachable")
      end
    end
    e(b)
  end
  local function c(a)
    local e, f
    local function h(a)
      a.LeadingWhite = ''
    end
    local function g(a, c)
      h(c)
      local a = a.Source:sub(-1, -1)
      local b = c.Source:sub(1, 1)
      if (a == '-' and b == '-') or (n[a] and n[b]) then
        c.LeadingWhite = ' '
      else
        c.LeadingWhite = ''
      end
    end
    local function d(b, a, d)
      e(a)
      h(d)
      local c = a:GetFirstToken()
      local a = a:GetLastToken()
      if c then
        g(b, c)
        g(a, d)
      else
        g(b, d)
      end
    end
    f = function(c)
      if c.Type == 'BinopExpr' then
        f(c.Lhs)
        h(c.Token_Op)
        f(c.Rhs)
        g(c.Token_Op, c.Rhs:GetFirstToken())
        g(c.Lhs:GetLastToken(), c.Token_Op)
      elseif c.Type == 'UnopExpr' then
        h(c.Token_Op)
        f(c.Rhs)
        g(c.Token_Op, c.Rhs:GetFirstToken())
      elseif c.Type == 'NumberLiteral' or c.Type == 'StringLiteral' or c.Type == 'NilLiteral' or c.Type == 'BooleanLiteral' or c.Type == 'VargLiteral' then
        h(c.Token)
      elseif c.Type == 'FieldExpr' then
        f(c.Base)
        h(c.Token_Dot)
        h(c.Field)
      elseif c.Type == 'IndexExpr' then
        f(c.Base)
        h(c.Token_OpenBracket)
        f(c.Index)
        h(c.Token_CloseBracket)
      elseif c.Type == 'MethodExpr' or c.Type == 'CallExpr' then
        f(c.Base)
        if c.Type == 'MethodExpr' then
          h(c.Token_Colon)
          h(c.Method)
        end
        if c.FunctionArguments.CallType == 'StringCall' then
          h(c.FunctionArguments.Token)
        elseif c.FunctionArguments.CallType == 'ArgCall' then
          h(c.FunctionArguments.Token_OpenParen)
          for a, b in pairs(c.FunctionArguments.ArgList) do
            f(b)
            local a = c.FunctionArguments.Token_CommaList[a]
            if a then
              h(a)
            end
          end
          h(c.FunctionArguments.Token_CloseParen)
        elseif c.FunctionArguments.CallType == 'TableCall' then
          f(c.FunctionArguments.TableExpr)
        end
      elseif c.Type == 'FunctionLiteral' then
        h(c.Token_Function)
        h(c.Token_OpenParen)
        for a, b in pairs(c.ArgList) do
          h(b)
          local a = c.Token_ArgCommaList[a]
          if a then
            h(a)
          end
        end
        if c.Token_Varg then
          h(c.Token_Varg)
        end
        h(c.Token_CloseParen)
        d(c.Token_CloseParen, c.Body, c.Token_End)
      elseif c.Type == 'VariableExpr' then
        h(c.Token)
      elseif c.Type == 'ParenExpr' then
        h(c.Token_OpenParen)
        f(c.Expression)
        h(c.Token_CloseParen)
      elseif c.Type == 'TableLiteral' then
        h(c.Token_OpenBrace)
        for a, b in pairs(c.EntryList) do
          if b.EntryType == 'Field' then
            h(b.Field)
            h(b.Token_Equals)
            f(b.Value)
          elseif b.EntryType == 'Index' then
            h(b.Token_OpenBracket)
            f(b.Index)
            h(b.Token_CloseBracket)
            h(b.Token_Equals)
            f(b.Value)
          elseif b.EntryType == 'Value' then
            f(b.Value)
          else
            assert(false, "unreachable")
          end
          local a = c.Token_SeparatorList[a]
          if a then
            h(a)
          end
        end
        c.Token_SeparatorList[#c.EntryList] = nil
        h(c.Token_CloseBrace)
      else
        assert(false, "unreachable, type: "..c.Type..":"..FormatTable(c))
      end
    end
    e = function(i)
      if i.Type == 'StatList' then
        for c = 1, #i.StatementList do
          local b = i.StatementList[c]
          e(b)
          h(b:GetFirstToken())
          local a = i.StatementList[c - 1]
          if a then
            if i.SemicolonList[c - 1] and (a:GetLastToken().Source ~= ')' or b:GetFirstToken().Source ~= ')') then
              i.SemicolonList[c - 1] = nil
            end
            if not i.SemicolonList[c - 1] then
              g(a:GetLastToken(), b:GetFirstToken())
            end
          end
        end
        i.SemicolonList[#i.StatementList] = nil
        if #i.StatementList > 0 then
          h(i.StatementList[1]:GetFirstToken())
        end
      elseif i.Type == 'BreakStat' then
        h(i.Token_Break)
      elseif i.Type == 'ReturnStat' then
        h(i.Token_Return)
        for b, a in pairs(i.ExprList) do
          f(a)
          if i.Token_CommaList[b] then
            h(i.Token_CommaList[b])
          end
        end
        if #i.ExprList > 0 then
          g(i.Token_Return, i.ExprList[1]:GetFirstToken())
        end
      elseif i.Type == 'LocalVarStat' then
        h(i.Token_Local)
        for b, a in pairs(i.VarList) do
          if b == 1 then
            g(i.Token_Local, a)
          else
            h(a)
          end
          local a = i.Token_VarCommaList[b]
          if a then
            h(a)
          end
        end
        if i.Token_Equals then
          h(i.Token_Equals)
          for a, b in pairs(i.ExprList) do
            f(b)
            local a = i.Token_ExprCommaList[a]
            if a then
              h(a)
            end
          end
        end
      elseif i.Type == 'LocalFunctionStat' then
        h(i.Token_Local)
        g(i.Token_Local, i.FunctionStat.Token_Function)
        g(i.FunctionStat.Token_Function, i.FunctionStat.NameChain[1])
        g(i.FunctionStat.NameChain[1], i.FunctionStat.Token_OpenParen)
        for b, a in pairs(i.FunctionStat.ArgList) do
          h(a)
          local a = i.FunctionStat.Token_ArgCommaList[b]
          if a then
            h(a)
          end
        end
        if i.FunctionStat.Token_Varg then
          h(i.FunctionStat.Token_Varg)
        end
        h(i.FunctionStat.Token_CloseParen)
        d(i.FunctionStat.Token_CloseParen, i.FunctionStat.Body, i.FunctionStat.Token_End)
      elseif i.Type == 'FunctionStat' then
        h(i.Token_Function)
        for a, b in pairs(i.NameChain) do
          if a == 1 then
            g(i.Token_Function, b)
          else
            h(b)
          end
          local a = i.Token_NameChainSeparator[a]
          if a then
            h(a)
          end
        end
        h(i.Token_OpenParen)
        for b, a in pairs(i.ArgList) do
          h(a)
          local a = i.Token_ArgCommaList[b]
          if a then
            h(a)
          end
        end
        if i.Token_Varg then
          h(i.Token_Varg)
        end
        h(i.Token_CloseParen)
        d(i.Token_CloseParen, i.Body, i.Token_End)
      elseif i.Type == 'RepeatStat' then
        h(i.Token_Repeat)
        d(i.Token_Repeat, i.Body, i.Token_Until)
        f(i.Condition)
        g(i.Token_Until, i.Condition:GetFirstToken())
      elseif i.Type == 'GenericForStat' then
        h(i.Token_For)
        for a, b in pairs(i.VarList) do
          if a == 1 then
            g(i.Token_For, b)
          else
            h(b)
          end
          local a = i.Token_VarCommaList[a]
          if a then
            h(a)
          end
        end
        g(i.VarList[#i.VarList], i.Token_In)
        for a, b in pairs(i.GeneratorList) do
          f(b)
          if a == 1 then
            g(i.Token_In, b:GetFirstToken())
          end
          local a = i.Token_GeneratorCommaList[a]
          if a then
            h(a)
          end
        end
        g(i.GeneratorList[#i.GeneratorList]:GetLastToken(), i.Token_Do)
        d(i.Token_Do, i.Body, i.Token_End)
      elseif i.Type == 'NumericForStat' then
        h(i.Token_For)
        for b, a in pairs(i.VarList) do
          if b == 1 then
            g(i.Token_For, a)
          else
            h(a)
          end
          local a = i.Token_VarCommaList[b]
          if a then
            h(a)
          end
        end
        g(i.VarList[#i.VarList], i.Token_Equals)
        for a, b in pairs(i.RangeList) do
          f(b)
          if a == 1 then
            g(i.Token_Equals, b:GetFirstToken())
          end
          local a = i.Token_RangeCommaList[a]
          if a then
            h(a)
          end
        end
        g(i.RangeList[#i.RangeList]:GetLastToken(), i.Token_Do)
        d(i.Token_Do, i.Body, i.Token_End)
      elseif i.Type == 'WhileStat' then
        h(i.Token_While)
        f(i.Condition)
        h(i.Token_Do)
        g(i.Token_While, i.Condition:GetFirstToken())
        g(i.Condition:GetLastToken(), i.Token_Do)
        d(i.Token_Do, i.Body, i.Token_End)
      elseif i.Type == 'DoStat' then
        h(i.Token_Do)
        h(i.Token_End)
        d(i.Token_Do, i.Body, i.Token_End)
      elseif i.Type == 'IfStat' then
        h(i.Token_If)
        f(i.Condition)
        g(i.Token_If, i.Condition:GetFirstToken())
        g(i.Condition:GetLastToken(), i.Token_Then)
        local c = i.Token_Then
        local b = i.Body
        for a, a in pairs(i.ElseClauseList) do
          d(c, b, a.Token)
          c = a.Token
          if a.Condition then
            f(a.Condition)
            g(a.Token, a.Condition:GetFirstToken())
            g(a.Condition:GetLastToken(), a.Token_Then)
            c = a.Token_Then
          end
          e(a.Body)
          b = a.Body
        end
        d(c, b, i.Token_End)
      elseif i.Type == 'CallExprStat' then
        f(i.Expression)
      elseif i.Type == 'AssignmentStat' then
        for a, b in pairs(i.Lhs) do
          f(b)
          local a = i.Token_LhsSeparatorList[a]
          if a then
            h(a)
          end
        end
        h(i.Token_Equals)
        for a, b in pairs(i.Rhs) do
          f(b)
          local a = i.Token_RhsSeparatorList[a]
          if a then
            h(a)
          end
        end
      else
        assert(false, "unreachable")
      end
    end
    e(a)
  end
  local e = 0
  local f = {}
  for a = ('a'):byte(), ('z'):byte() do
    table.insert(f, string.char(a))
  end
  for a = ('A'):byte(), ('Z'):byte() do
    table.insert(f, string.char(a))
  end
  for a = ('0'):byte(), ('9'):byte() do
    table.insert(f, string.char(a))
  end
  table.insert(f, '_')
  local b = {}
  for a = ('a'):byte(), ('z'):byte() do
    table.insert(b, string.char(a))
  end
  for a = ('A'):byte(), ('Z'):byte() do
    table.insert(b, string.char(a))
  end
  local function g(d)
    local c = ''
    local a = d % #b
    d = (d - a) / #b
    c = c..b[a + 1]
    while d > 0 do
      local a = d % #f
      d = (d - a) / #f
      c = c..f[a + 1]
    end
    return c
  end
  local function b()
    local a = e
    e = e + 1
    return g(a)
  end
  local function a()
    local a = ''
    repeat
      a = b()
    until not p[a]
    return a
  end
  local function a(c, a)
    local d = {}
    local e = 0
    for a, a in pairs(c) do
      if a.AssignedTo then
        a:Rename('_TMP_'..e..'_')
        e = e + 1
      else
        d[a.Name] = true
      end
    end
    local function b(a)
      for a, a in pairs(a.VariableList) do
        a:Rename('_TMP_'..e..'_')
        e = e + 1
      end
      for a, a in pairs(a.ChildScopeList) do
        b(a)
      end
    end
    local e = 0
    for a, a in pairs(c) do
      if a.AssignedTo then
        local b = ''
        repeat
          b = g(e)
          e = e + 1
        until not p[b] and not d[b]
        a:Rename(b)
      end
    end
    a.FirstFreeName = e
    local function b(c)
      for a, a in pairs(c.VariableList) do
        local b = ''
        repeat
          b = g(c.FirstFreeName)
          c.FirstFreeName = c.FirstFreeName + 1
        until not p[b] and not d[b]
        a:Rename(b)
      end
      for a, a in pairs(c.ChildScopeList) do
        a.FirstFreeName = c.FirstFreeName
        b(a)
      end
    end
    b(a)
  end
  local function f(a, b, c)
    local e = {}
    for b, a in pairs(p) do
      e[b] = true
    end
    local f = {}
    local d = {}
    do
      for a, a in pairs(a) do
        if a.AssignedTo and c then
          table.insert(f, a)
        else
          e[a.Name] = true
        end
      end
      local function c(a)
        for a, a in pairs(a.VariableList) do
          table.insert(f, a)
          table.insert(d, a)
        end
        for a, a in pairs(a.ChildScopeList) do
          c(a)
        end
      end
      c(b)
    end
    for a, a in pairs(f) do
      a.UsedNameArray = {}
    end
    table.sort(f, function(a, b)
      return #a.RenameList < #b.RenameList
    end)
    local c = 0
    local a = {}
    local function b(b)
      local d = a[b]
      if not d then
        repeat
          d = g(c)
          c = c + 1
        until not e[d]
        a[b] = d
      end
      return d
    end
    for a, d in pairs(f) do
      d.Renamed = true
      local c = 1
      while d.UsedNameArray[c] do
        c = c + 1
      end
      d:Rename(b(c))
      if d.Scope then
        for a, b in pairs(f) do
          if not b.Renamed then
            if not b.Scope or b.Scope.Depth < d.Scope.Depth then
              for a, a in pairs(b.ReferenceLocationList) do
                if a >= d.BeginLocation and a <= d.ScopeEndLocation then
                  b.UsedNameArray[c] = true
                  break
                end
              end
            elseif b.Scope.Depth > d.Scope.Depth then
              for a, a in pairs(d.ReferenceLocationList) do
                if a >= b.BeginLocation and a <= b.ScopeEndLocation then
                  b.UsedNameArray[c] = true
                  break
                end
              end
            else
              if d.BeginLocation < b.EndLocation and d.EndLocation > b.BeginLocation then
                b.UsedNameArray[c] = true
              end
            end
          end
        end
      else
        for a, b in pairs(f) do
          if not b.Renamed then
            if b.Type == 'Global' then
              b.UsedNameArray[c] = true
            elseif b.Type == 'Local' then
              for a, a in pairs(d.ReferenceLocationList) do
                if a >= b.BeginLocation and a <= b.ScopeEndLocation then
                  b.UsedNameArray[c] = true
                  break
                end
              end
            else
              assert(false, "unreachable")
            end
          end
        end
      end
    end
  end
  local function e(d, a, c)
    local b = {}
    for a, a in pairs(d) do
      if not a.AssignedTo or not c then
        b[a.Name] = true
      end
    end
    local f = 1
    local e = 1
    local function b(a, b)
      a.Name = b
      for a, a in pairs(a.RenameList) do
        a(b)
      end
    end
    if c then
      for a, a in pairs(d) do
        if a.AssignedTo then
          b(a, 'G_'..e..'_')
          e = e + 1
        end
      end
    end
    local function c(a)
      for a, a in pairs(a.VariableList) do
        local c = 'L_'..f..'_'
        if a.Info.Type == 'Argument' then
          c = c..'arg'..a.Info.Index
        elseif a.Info.Type == 'LocalFunction' then
          c = c..'func'
        elseif a.Info.Type == 'ForRange' then
          c = c..'forvar'..a.Info.Index
        end
        b(a, c)
        f = f + 1
      end
      for a, a in pairs(a.ChildScopeList) do
        c(a)
      end
    end
    c(a)
  end
  local b = {}
  function b.Beautify(g, a, b, h)
    local i
    if a then
      local d = CreateLuaParser(g)
      local b, a = AddVariableInfo(d)
      f(b, a, h)
      c(d)
      i = PrintAst(d)
    end
    local f = CreateLuaParser(i or g)
    local a, c = AddVariableInfo(f)
    if b then
      e(a, c, h)
    end
    d(f)
    local a = PrintAst(f)
    local b = io.open('beau/2.lua', 'wb')
    b:write(a)
    b:close()
  end
  function readAll(a)
    local b = assert(io.open(a, "rb"))
    local a = b:read("*all")
    b:close()
    return a
  end
  local a = readAll('beau/1.lua')
  local ab, ac = pcall(function()
    b.Beautify(a, minifyVariables)
  end)