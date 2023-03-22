## Load Balancer
resource "hcloud_load_balancer" "testing_load_balancer" {
  name               = "testing-load-balancer"
  load_balancer_type = "lb11"
  location           = "fsn1"
  labels = {
    "tag" : "terraform-testing"
  }
}
resource "hcloud_load_balancer_target" "load_balancer_target01" {
  type             = "server"
  load_balancer_id = hcloud_load_balancer.testing_load_balancer.id
  server_id        = hcloud_server.terraform-testing01.id
}
resource "hcloud_load_balancer_target" "load_balancer_target02" {
  type             = "server"
  load_balancer_id = hcloud_load_balancer.testing_load_balancer.id
  server_id        = hcloud_server.terraform-testing02.id
}
# Service type
resource "hcloud_load_balancer_service" "load_balancer_service01" {
    load_balancer_id = hcloud_load_balancer.testing_load_balancer.id
    protocol         = "http"
}

/* # DNS
resource "hcloud_rdns" "load_balancer_master" {
  load_balancer_id = "${hcloud_load_balancer.testing_load_balancer.id}"
  ip_address       = "${hcloud_load_balancer.testing_load_balancer.ipv4}"
  dns_ptr          = "lb.vlad.linkpc.net"
} */

# Sert
/* resource "hcloud_managed_certificate" "managed_cert" {
  name         = "managed_cert"
  domain_names = ["lb.vlad.linkpc.net"]
  labels = {
    label_1 = "value_1"
    label_2 = "value_2"
  }
} */

resource "hcloud_uploaded_certificate" "lb_certificate" {
    name = "test-certificate-%d"

    private_key =<<-EOT
-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDCDc7D2tuvjU31
2mb+m4LGN1mifBC6acgJex/wUcNKWzvXwWrKBGT/dhiqGpdJi6sNX8D/Ur+f//Va
2+U8rWiTdjP37HCKuHKaYkzSvgagyS4QMt1OHOS/l0IgSSDtT6b8bW6udOS8teg5
WbMtzMlotW7bqflUm8IlNjpV/8blaT9in4uhOC9As8IhCpQfWsAS4ijz5/6+e+zr
eqgS20Cm/TzDdjiHArvTPPuajQ8rz81m2ev0y2qCvJrCmCGJWFr0DeQrUYaonXK3
uMDI4ffjIMvyumW+qY1Z75HitX8HB0oZQT88T0Gj4T3WsRwM6p2+63wuFgB6Usrg
jPXQr2EfAgMBAAECggEAUGrWb9XHyqV9VFAw9HxPooMXkz1k1Uu3CS7MGpRXoP3T
++J8tcFCdZdkO0IPxfuqZD11RpntLYouDHwqMI4QU2Pdv3VtYh9z5sSr332+U21r
uGzLx24z4a32Sljj21Rx+BQFlSh+DjI4TWP93BIMuWbOzRtQZx6xQyiI3lDEBRdx
VT9tK4tToRrHQcnZla4/WqggGOFVNt9ZiAJ3q+7JsUjK3up5X5RThZI0O2RLYVLo
d+ydu1oco8hASlKaZg2pvbqAVIv7+z5QAHsE5Pm4gaN6X/M9doBPJmQiNcOskEYD
RlH/jQSe3PJ4LsPYtT0itAVW/QULygfmASERudsA+QKBgQD9np3uLbwVyzIMd4ss
PlUtxf2zIrCFL28hlTrFN1OCDtSJ5OdzpNpthcIytgbMTpmwmMR8l+JSpv1JFZZA
Vsdv6CKh8curqJ2nhsv1yBIQufWqmy4weD9kS74s87LFRJvLMJto2LvOx6zjtE/z
6sz4FlVQ74jlHGKwR0vYIqA/xQKBgQDD4BHXtpyi4ri5wc5mvizvHAE7CW3cn7NK
dizi63SwUDcjSUjkQKfZBpIUAxaCTfPloul3UZnPuPAxKQQ15KQXryyvDnizhZmk
Yua6gf1BlxglbccbbAuaMFTGEbpD3CDnIO1+svDoh1beaCGmR77qp7p6SYNmYzXA
iIDzMqDnkwKBgQDWZgKIWK1Jly7GD0DdtAv52AgyKT8kOAcwUqEOG0lDBxpxP8rR
nijwsUSL7gktKb0O5vYjhZpT2MsBv3f3B+UtGwY79NYCVVaBSpidO/bZoPqmsOyJ
GP4t4UHxakpULT2utXaLWbzafz4OeF2mi3Weu/J/qx8E38wlzP+2xP7HKQKBgAXd
LWuR0fqmYvVcsfstclbuNbM4wws51LpD83APsHyeyifKR95deSjsI29p8ECSaNzV
Fbw2uy4W0UoHelLKt4bl/aZ3/nERbNoZA+NNhPFzvotQUAeoImjJTaBoY3Uon+uL
dtC2NrQfaSBbabZ6q2KHBvQmQ0LLcY6EB6hAOcT1AoGBAIOEyLIRMdmlL+yhAR8E
vceCZafm6GsWT40uyYV6bi7VJZcsFK+oH8zPwsQ/1PxPHSkw86Vnq2TuEV/MttBo
jMZrX8TvvGsWfcv7seczG3Focl4mX/uT9oRcWPSsSW2BcHYN1CG0mqu1nltze/8t
IyfBEvvgHzHOWIOFQ0n/qqnL
-----END PRIVATE KEY-----
    EOT

    certificate =<<-EOT
-----BEGIN CERTIFICATE-----
MIIFKzCCBBOgAwIBAgISA70o4CdidX8X39Vrk3dF3l7rMA0GCSqGSIb3DQEBCwUA
MDIxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MQswCQYDVQQD
EwJSMzAeFw0yMzAyMTMyMTAyMDJaFw0yMzA1MTQyMTAyMDFaMB0xGzAZBgNVBAMT
EmxiLnZsYWQubGlua3BjLm5ldDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAMINzsPa26+NTfXaZv6bgsY3WaJ8ELppyAl7H/BRw0pbO9fBasoEZP92GKoa
l0mLqw1fwP9Sv5//9Vrb5TytaJN2M/fscIq4cppiTNK+BqDJLhAy3U4c5L+XQiBJ
IO1Ppvxtbq505Ly16DlZsy3MyWi1btup+VSbwiU2OlX/xuVpP2Kfi6E4L0CzwiEK
lB9awBLiKPPn/r577Ot6qBLbQKb9PMN2OIcCu9M8+5qNDyvPzWbZ6/TLaoK8msKY
IYlYWvQN5CtRhqidcre4wMjh9+Mgy/K6Zb6pjVnvkeK1fwcHShlBPzxPQaPhPdax
HAzqnb7rfC4WAHpSyuCM9dCvYR8CAwEAAaOCAk4wggJKMA4GA1UdDwEB/wQEAwIF
oDAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAd
BgNVHQ4EFgQUL5ytFc/3UowobxNQLG3ZScEJJaMwHwYDVR0jBBgwFoAUFC6zF7dY
VsuuUAlA5h+vnYsUwsYwVQYIKwYBBQUHAQEESTBHMCEGCCsGAQUFBzABhhVodHRw
Oi8vcjMuby5sZW5jci5vcmcwIgYIKwYBBQUHMAKGFmh0dHA6Ly9yMy5pLmxlbmNy
Lm9yZy8wHQYDVR0RBBYwFIISbGIudmxhZC5saW5rcGMubmV0MEwGA1UdIARFMEMw
CAYGZ4EMAQIBMDcGCysGAQQBgt8TAQEBMCgwJgYIKwYBBQUHAgEWGmh0dHA6Ly9j
cHMubGV0c2VuY3J5cHQub3JnMIIBBQYKKwYBBAHWeQIEAgSB9gSB8wDxAHYAtz77
JN+cTbp18jnFulj0bF38Qs96nzXEnh0JgSXttJkAAAGGTMyZ2AAABAMARzBFAiEA
vFbE251bU0e87oNBkrZD7FXIF2YI8KVEJk8G47ZFyTUCIDvjK9otImpcYob+KOAv
oGWvYaQ6MDuuJQx91TJpRHahAHcAejKMVNi3LbYg6jjgUh7phBZwMhOFTTvSK8E6
V6NS61IAAAGGTMyZ/QAABAMASDBGAiEA+FraeA9+hkrDvQ/crVE5ePG9d/8nNkXg
rPGZHs/IMtMCIQCAt00aaEGRkk3veT9g4QOWXJgrbjRbCNxkNcUZZ3K4gDANBgkq
hkiG9w0BAQsFAAOCAQEAoRhKrn78Lc50Mdhj3EmBKslJhDaAiGMQjpr1/K7ocCuE
0sj+lw39ACmEp242iixYPscQaqtn6p5kubNAYUGvixA/Ieg2I4uIvdiIUFdEBue4
lfkaOkRQV/72So71obzsZw9OC445csuPowXXaDgaohlr1GVmjV02uyvzrULKT+bW
bUxmh/eHyuH7kccen2D4OI4Q8nKMWukpjDDi9dLZGSAFMW51T/o844PU/fYF2Koe
AeQB1+/hQ7UrgSwFh08Jqs49rOCN/MEjaubKiMiNajT7KhdcgtKMhXyd9/oxhm5h
2Wg5AFdpfL52uAVDNS42j0MBG6TPzjUXyt7G8OhImw==
-----END CERTIFICATE-----
    EOT

    labels = {
        label_1 = "value_1"
        label_2 = "value_2"
    }
}