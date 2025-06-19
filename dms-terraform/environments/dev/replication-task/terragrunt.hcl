locals {
  # Get common variables from parent
  common_vars = read_terragrunt_config("../root.hcl")
  account_code = local.common_vars.locals.account_code
  env_code = local.common_vars.locals.env_code
  application_name = local.common_vars.locals.application_name
  env = local.common_vars.locals.env
}

# Include parent configuration
include "root" {
  path = "../root.hcl"
}

# Module configuration
terraform {
  source = "../../../modules/replication-task"
}

# Module inputs
inputs = {
  # Common variables
  account_code = local.account_code
  env_code = local.env_code
  application_name = local.application_name
  env = local.env

  # Replication task specific variables
  replication_task_id = "${local.application_name}-replication-task"
  migration_type = "full-load-and-cdc"
  db_list = ["db1", "db2"]
  replication_instance_arn = ""
  source_endpoint_arn = ""
  target_endpoint_arn = ""
  table_mappings = jsonencode({
    rules = [
      {
        "rule-type" = "selection"
        "rule-id" = "1"
        "rule-name" = "1"
        "object-locator" = {
          "schema-name" = "public"
          "table-name" = "%"
        }
        "rule-action" = "include"
      }
    ]
  })
  replication_task_settings = jsonencode({
    TargetMetadata = {
      BatchApplyEnabled = false
    }
    FullLoadSettings = {
      TargetTablePrepMode = "DO_NOTHING"
      StopTaskCachedChangesApplied = false
      StopTaskCachedChangesNotApplied = false
      MaxFullLoadSubTasks = 8
      TaskRecoveryTableEnabled = false
    }
    ChangeProcessingTuning = {
      BatchApplyPreserveTransaction = true
      BatchApplyTimeoutMin = 1
      BatchApplyMemoryLimit = 500
      BatchSplitSize = 0
      MinTransactionSize = 1000
      CommitRate = 10000
    }
    ChangeProcessingDdlHandlingPolicy = {
      HandleSourceTableDropped = true
      HandleSourceTableTruncated = true
      HandleSourceTableAltered = true
    }
    ErrorBehavior = {
      DataErrorPolicy = "LOG_ERROR"
      DataTruncationErrorPolicy = "LOG_ERROR"
      DataErrorEscalationPolicy = "SUSPEND_TABLE"
      DataErrorEscalationCount = 0
      TableErrorPolicy = "SUSPEND_TABLE"
      TableErrorEscalationPolicy = "STOP_TASK"
      TableErrorEscalationCount = 0
      RecoverableErrorCount = -1
      RecoverableErrorInterval = 5
      RecoverableErrorThrottling = true
      RecoverableErrorThrottlingMax = 1800
      ApplyErrorDeletePolicy = "IGNORE_RECORD"
      ApplyErrorInsertPolicy = "LOG_ERROR"
      ApplyErrorUpdatePolicy = "LOG_ERROR"
      ApplyErrorEscalationPolicy = "LOG_ERROR"
      ApplyErrorEscalationCount = 0
      FullLoadIgnoreConflicts = true
    }
    StreamBufferSettings = {
      StreamBufferCount = 3
      StreamBufferSizeInMB = 8
      CtrlStreamBufferSizeInMB = 5
    }
    Logging = {
      EnableLogging = true
      LogComponents = [
        {
          Id = "TRANSFORMATION"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "SOURCE_UNLOAD"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "IO"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "TARGET_LOAD"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "PERFORMANCE"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "SOURCE_CAPTURE"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "SORTER"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "REST_SERVER"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "VALIDATOR"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "TARGET_APPLY"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "TASK_MANAGER"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "TABLES_MANAGER"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "METADATA_MANAGER"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "FILE_FACTORY"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "COMMON"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "ADDONS"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "DATA_STRUCTURE"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "COMMUNICATION"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        },
        {
          Id = "FILE_TRANSFER"
          Severity = "LOGGER_SEVERITY_DEFAULT"
        }
      ]
    }
  })
}
