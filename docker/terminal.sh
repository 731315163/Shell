#!/bin/bash
#进入docker 内部
docker exec -it 4da44f6354e5 /bin/bash
#重新映射端口后续重启docker
systemctl restart docker