return {
  s("logt", { t("const TAG = \"["), f(function(_, snip)
    local filename = snip.env.TM_FILENAME
    return filename:match("(.+)%..+$") or filename
  end), i(1), t("]\";")  }),
  s("logd", { t("console.log(TAG, \""), i(1), t("\");") }),
  s("logp", { t("console.log(JSON.stringify("), i(1), t(", null, 2));") }),
}
