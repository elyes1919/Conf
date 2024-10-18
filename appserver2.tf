resource "google_compute_instance" "swarm-slave1" {
  boot_disk {
    auto_delete = true
    device_name = "swarm-slave1"

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240910"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "e2-medium"
  name         = "swarm-slave1"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/pfe-elyes-435322/regions/northamerica-northeast1/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "465873615483-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

   metadata = {
    ssh-keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxHBrxJeznzcUUWIlBKziU/mxG3mQJg+6vEujz2xcE/dAcsxUMmXkoBVtf0jX2tc7+XcN5D6YzjF52K3eV2YXyK5txazNgjYwduZq60DB8msQpKhkMZZKs4oFqQ1pZMmLu/Q6J8bfPsCJzT/b/vUfL5pKj4xwCQsdFA7AI1INGz/sJiDE1SMTesIyJAOs20rzfs0N9Iz6rDc+uN9HeEAlfPqq4wpVETYozSFsBpZzQjNSBpAu+LTEgBOafPp2LzpcvdQivvorW1X+aIp3t2asQacXYFW8aPppVyP/Bo7QzE24bOO7Faq9ewN2FbaKnDcR8KWrOwyKY/rwLM1abkCsKf06nd4Z1GZnjHcNjlixDB6EqGaVVIgmo44dHjnGSeup4ER2a5qwTtxXbZRJS73tuVRHBwbxJpHfTp55TtrGyDeqFB7GCLaqbdVBZaV5IIeytbppG06G4NtweQx2q/a4cSAvfZyLj5eNXpUoXeslnHZeAHePaPhL1h1gP7xZpL2k= azuread\elyesguettat@eguettat"
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = ["http-server", "https-server"]
  zone = "northamerica-northeast1-a"
}
