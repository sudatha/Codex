# Mock Interview Preparation - Senior Data Engineer

## 60-Second Introduction

Use this as your opening answer:

"I am a hands-on data and integration leader with 15+ years across data platforms, SQL Server, Azure, ETL/ELT, data modelling, and enterprise reporting. In recent roles at Attekus and Abano Healthcare, I worked on data platform architecture, governance, integration patterns, analytics readiness, and modernization roadmaps in healthcare-related environments. My strengths are building reliable data pipelines, improving data quality and governance, translating business needs into practical engineering solutions, and working across technical and business stakeholders. This role interests me because it combines healthcare data, scalable analytics platforms, and hands-on engineering leadership, which aligns well with the work I have been doing."

## What The Interviewer Will Test

- Depth in data engineering, not just architecture.
- Healthcare domain credibility.
- Whether you can handle ingestion, modelling, quality, governance, and delivery end to end.
- How well you deal with tools named in the PD that are not clearly shown in your CV.
- Whether you can lead technically without overselling.

## Your Strongest Evidence From Your CV

- Attekus: Fabric medallion architecture, ETL/ELT patterns, monitoring, alerting, governance.
- Abano Healthcare: healthcare environment, integration mapping, modernization roadmap, dimensional modelling, enterprise reporting.
- Whanau Tahi: regulated healthcare environment, e-Prescription platform, migration, validation, operational governance.
- Northland District Health Board: clinical data migration and healthcare operations exposure.
- Broad SQL Server and Azure background with data quality, reliability, and stakeholder engagement.

## Risk Areas To Handle Carefully

- Do not claim direct hands-on experience with FHIR, USCDI, DICOM, Snowflake, ClickHouse, dbt, Airbyte, Kafka, Flink, or Terraform unless you can back it up.
- Position yourself as strong in adjacent patterns: healthcare data operations, Azure platforms, ETL/ELT, dimensional modelling, API integration, governance, validation, and scalable architecture.
- If asked about a tool gap, answer with a transferability pattern: "I have not used that exact tool in production, but I have done the equivalent engineering work in ..."

## Mock Interview Questions And Answer Direction

### 1. Tell me about yourself.

Answer direction:
- Start with 15+ years in data, integration, and platform delivery.
- Emphasize recent healthcare-related roles.
- Mention hands-on strengths: SQL, ETL/ELT, Azure, data modelling, governance, reliability.
- Close with why this role fits now.

### 2. Why are you interested in this role?

Answer direction:
- It combines healthcare data, analytics platforms, and hands-on engineering.
- You have worked in healthcare and regulated environments.
- You enjoy building reliable data platforms that support operational and analytical outcomes.

### 3. What experience do you have in healthcare data?

Answer direction:
- Abano Healthcare: data and integration architecture across a large distributed healthcare business.
- Whanau Tahi: national e-Prescription platform in a regulated environment.
- Northland District Health Board: clinical data migration and go-live support.
- Stress governance, sensitivity, reliability, and operational continuity.

### 4. Have you worked with EMR/EHR and imaging data?

Best honest answer:
- "I have worked in healthcare data environments and clinical data contexts, but I would be careful not to overstate direct hands-on ownership of every EMR or imaging platform listed in your PD. My relevant strength is designing integration patterns, data flows, validation, and analytics-ready structures across complex source systems."

### 5. How would you design a scalable ingestion framework for EMR and imaging systems?

Answer direction:
- Separate batch and near-real-time ingestion paths.
- Use source-aligned connectors or APIs first, then standardize landing patterns.
- Store raw data in a bronze layer, validated conformed data in silver, analytics-ready models in gold.
- Add schema control, data quality checks, lineage, retries, alerting, and reconciliation.
- Design for idempotency, auditability, and PHI/PII controls from day one.

### 6. How do you approach ETL vs ELT?

Answer direction:
- Choose based on platform capability, latency, cost, and governance.
- Prefer raw ingestion with controlled downstream transformation when platform scale supports it.
- Keep transformations testable, observable, and business-rule driven.
- Mention your ETL/ELT pattern design at Attekus.

### 7. How do you ensure data quality in pipelines?

Answer direction:
- Define checks at ingestion, transformation, and consumption layers.
- Validate completeness, schema drift, null thresholds, duplicates, referential integrity, and business rules.
- Add monitoring, alerting, and operational runbooks.
- Mention validation controls and monitoring you implemented at Attekus.

### 8. Explain your approach to dimensional modelling.

Answer direction:
- Start with business process and grain.
- Identify facts, dimensions, conformed dimensions, and history strategy.
- Use star schema for reporting simplicity and performance.
- Mention standards and reusable design patterns you established at Abano.

### 9. How do you optimize data platform performance?

Answer direction:
- Start with workload profiling and access patterns.
- Optimize model design, partitioning, indexing or clustering strategy, and transformation logic.
- Reduce unnecessary movement and repeated computation.
- Balance performance with cost and operational simplicity.

### 10. Tell us about a data platform modernization initiative you led.

Answer direction:
- Use Abano Healthcare.
- Current-state assessment, dependency mapping, migration roadmap, architecture direction.
- Focus on business impact: clarity, reduced risk, future scalability, better reporting.

### 11. How do you work with stakeholders who are not technical?

Answer direction:
- Translate requirements into data contracts, process flows, and priority decisions.
- Confirm definitions early.
- Use examples, prototypes, and impact-based communication.
- Mention your work with executive and operational stakeholders.

### 12. How do you manage governance and compliance in healthcare data?

Answer direction:
- Access control, least privilege, auditability, retention, lineage, validation, change control.
- Clear ownership and stewardship.
- Separate sensitive raw data from curated consumer layers.
- Mention regulated healthcare environments and governance standards from your roles.

### 13. What is your experience with Azure for data engineering?

Answer direction:
- Azure SQL, Azure Synapse, Microsoft Fabric, Event Hub, Azure-aligned delivery.
- ETL/ELT, platform modernization, reporting, integration, monitoring.
- Be precise about what you used directly.

### 14. Have you used Snowflake or ClickHouse?

Best honest answer:
- "My strongest hands-on background is in SQL Server, Azure, Synapse, and Microsoft Fabric rather than Snowflake or ClickHouse. The transferable parts are schema design, workload optimization, dimensional modelling, ELT design, and analytics platform architecture. I can ramp quickly because those engineering principles are the same even when the engine changes."

### 15. Have you used dbt, Airbyte, Kafka, or Flink?

Best honest answer:
- "Not all of those tools are explicitly part of my production background. What I do bring is the underlying delivery experience: orchestrated pipelines, API integration, ETL/ELT design, event-aware ingestion patterns, monitoring, and operational support. I would position myself as strong on the engineering patterns and ready to adopt the specific toolchain you use."

### 16. How do you design for reliability and observability?

Answer direction:
- Logging, metrics, alerting, reconciliation, retries, dead-letter handling where relevant.
- Runbooks and ownership.
- Distinguish between transient failures, source issues, and transformation defects.

### 17. How have you mentored or led engineers?

Answer direction:
- Technical standards, design guidance, review discipline, supportability improvements.
- Leadership through architecture, governance, documentation, and delivery guardrails.
- Avoid overstating direct line management if it was mostly technical leadership.

### 18. Describe a difficult migration or cutover you handled.

Answer direction:
- Use Whanau Tahi 8 TB SQL Server to Azure migration or Whangarei District Council cutover.
- Cover planning, staged testing, validation, rollback thinking, and controlled execution.

### 19. How do you handle changing priorities in a lean environment?

Answer direction:
- Reconfirm business priority and delivery risk.
- Break work into stable increments.
- Protect critical controls: quality, compliance, operational readiness.
- Show that you stay calm and practical.

### 20. What would you do in your first 90 days?

Suggested structure:
- First 30 days: understand source systems, stakeholders, current architecture, risks, controls, delivery backlog.
- Next 30 days: assess ingestion patterns, data quality gaps, modelling standards, observability, and priority use cases.
- Final 30 days: deliver 1-2 practical improvements, agree standards, and define a realistic platform roadmap.

## Technical Deep-Dive Questions To Practice

### How would you model clinical encounter data for analytics?

Talk through:
- Defining the reporting grain.
- Fact tables for encounters/events.
- Dimensions for patient, provider, location, time, service type.
- Privacy controls and de-identification requirements for analytics use cases.

### How would you handle schema drift from upstream EMR systems?

Talk through:
- Raw landing zone.
- Versioned schemas and metadata capture.
- Validation rules and controlled promotion to curated layers.
- Impact analysis before downstream release.

### How would you support both operational reporting and analytics workloads?

Talk through:
- Separate consumption patterns.
- Avoid overloading transactional sources.
- Use curated analytical models for BI.
- Keep SLA and latency expectations explicit.

### How would you deal with duplicate or conflicting patient-related records?

Talk through:
- Matching rules, survivorship logic, audit trail, and exception handling.
- Clinical data sensitivity means ambiguous matches should be reviewed, not guessed.

## Behavioural Questions To Practice

### Tell me about a time you improved data quality.

Use Attekus:
- Situation: critical pipelines needed stronger reliability.
- Task: improve trust and operational support.
- Action: validation controls, monitoring, alerting, standards.
- Result: better reliability and supportability.

### Tell me about a time you influenced without authority.

Use Abano or Attekus:
- Cross-functional stakeholders.
- Architecture direction or standards uplift.
- Focus on structured assessment and pragmatic communication.

### Tell me about a time something failed in production.

Prepare:
- How you identified the issue.
- Immediate containment.
- Root-cause analysis.
- Permanent fix and control improvement.

## Smart Questions To Ask Them

- What are the main source systems for EMR, imaging, and operational data today?
- Which part of the role is most urgent in the first six months: ingestion, modelling, platform standardization, or analytics delivery?
- How mature is your current Azure data platform and what tools are already in production?
- How much of the role is hands-on engineering versus technical leadership and architecture?
- What healthcare data standards are actively in use today: HL7, FHIR, DICOM, or custom interfaces?
- What does success look like by 90 days and 12 months?

## Short Answers For Likely Gap Questions

### "You do not seem to have direct Snowflake or ClickHouse experience."

"That is fair. My direct experience is stronger in SQL Server, Azure Synapse, and Fabric. The core engineering work you need here, such as schema design, ELT optimization, dimensional modelling, governance, and reliable data delivery, is exactly where I have depth."

### "You do not show direct FHIR or DICOM delivery."

"I would be careful not to overclaim that. My healthcare experience is real, particularly in regulated environments, clinical data migration, and healthcare integration architecture. Where I add value is building the engineering discipline around ingestion, modelling, quality, security, and analytics readiness while ramping quickly on the specific standards in use."

### "Why should we hire you if some named tools are missing?"

"Because the platform and delivery fundamentals are strong in my background: data modelling, SQL, ETL/ELT, Azure, governance, integration, stakeholder engagement, and healthcare context. I would bring low-risk senior engineering judgment and can ramp on tool-specific gaps quickly."

## Final Interview Advice

- Stay accurate. This PD is technical enough that overclaiming will get exposed.
- Lead with healthcare context, data platform delivery, governance, and reliability.
- Bridge tool gaps with equivalent engineering experience.
- Use concise examples from Attekus, Abano, Whanau Tahi, and Northland District Health Board.
- When unsure, say what you have done, what is adjacent, and how you would approach the problem.
