local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  -- add stm for cpp
  s("stm", {
    -- Simple static text.
    t({"#include<iostream>"}),
    t({"", "", "int main() {"}),
    t({"", "    "}),
    i(1),
    t({"", "    return 0;"}),
    t({"", "}"}),
  }),
})

ls.add_snippets("c", {
  -- add stm for c
  s("stm", {
    -- Simple static text.
    t({"#include<stdio.h>"}),
    t({"", "", "int main() {"}),
    t({"", "    "}),
    i(1),
    t({"", "    return 0;"}),
    t({"", "}"}),
  }),
  s("fanymain", {
    -- Simple static text.
    t({"", "", "int main() {"}),
    t({"", "    "}),
    i(1),
    t({"", "    return 0;"}),
    t({"", "}"}),
  }),
  s("/*", {
    -- Simple static text.
    t({"/* "}),
    i(1),
    t({" */"})
  }),
})
