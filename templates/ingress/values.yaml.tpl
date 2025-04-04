controller:
  replicaCount: ${controller_replica_count}
  service:
    type: ${service_type}
    annotations:
%{ for key, value in extra_annotations ~}
      ${key}: "${value}"
%{ endfor ~}
