core.register_action("verify_crt", {"tcp-req"}, function (txn)
    -- 获取客户端证书的 DER 编码
    local cert = txn.f:ssl_c_der()

    -- 通过 HTTP 调用校验证书
    local cli = core.httpclient()
    local ok, resp = pcall(cli.post, cli, {
        url="http://172.17.0.1:8080/check_der",
        body=cert,
    })
    -- 调用报错，打印但不阻止
    if (not ok) then
        txn:Warning("skip verify due to error: " .. resp)
        return
    end

    -- API 返回异常，打印但不阻止
    if (resp.status ~= 200) then
        txn:Warning("skip verify due to status: " .. resp.status)
        return
    end

    -- 校验不通过，阻止连接
    if (resp.body ~= "ok") then
        txn:Warning("deny invalid crt")
        txn:done()
    end
end)
