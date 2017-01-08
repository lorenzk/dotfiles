function proxy
  set proxy http://proxy.newsaktuell.de:8080

  if test "$http_proxy" = "$proxy"
    echo "Disabling proxy"
    set -Ue http_proxy
    set -Ue https_proxy
    set -Ue HTTP_PROXY
    set -Ue HTTPS_PROXY
    set -Ue all_proxy
  else
    echo "Setting proxy to $proxy"
    set -Ux http_proxy $proxy
    set -Ux https_proxy $proxy
    set -Ux HTTP_PROXY $proxy
    set -Ux HTTPS_PROXY $proxy
    set -Ux all_proxy $proxy
  end
end
