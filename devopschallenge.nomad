
job "example" {

  datacenters = ["devops"]

  type = "service"


  update {

    max_parallel = 1
    min_healthy_time = "10s"
    healthy_deadline = "3m"
    progress_deadline = "10m"
    auto_revert = false
    canary = 0
  }

  migrate {

    max_parallel = 1
    health_check = "checks"
    min_healthy_time = "10s"
    healthy_deadline = "5m"
  }

  group "devopschallenge" {

    count = 1

    network {
      port "devopschallenge" {
        to = 3000
      }
    }

    service {

      name = "devopschallenge"
      tags = ["global", "devops"]
      port = "devopschallenge"
    }

    restart {

      attempts = 2
      interval = "30m"
      delay = "15s"
      mode = "fail"
    }

    ephemeral_disk {

      size = 300
    }

    task "devopschallenge" {

      driver = "docker"

      config {
        image = "devopschallenge:latest"

        ports = ["devopschallenge"]
      }

      resources {
        cpu    = 1024 
        memory = 1024
      }
    }
  }
}
