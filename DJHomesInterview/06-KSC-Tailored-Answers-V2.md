# Tailored Key Selection Criteria Answers V2

These answers incorporate the DJ Homes position requirements, the existing tailored draft, and the additional experience details you added.

## 1. Master Data Management Strategy & Implementation

At Abano Healthcare Group, one of the recurring challenges was that critical entities were being used across a large integration and analytics estate without enough consistency in ownership, definitions, and downstream reporting logic. As the Data and Analytics Architect, I took ownership of the architecture direction for an environment spanning more than 250 endpoints, and part of that work was to strengthen how core data domains were governed and standardised.

One practical issue was that endpoint systems used different dental platforms with different logical and physical data structures. Even where the same platform existed in multiple locations, legacy implementations often used different business codes and mapping rules. A key master data issue was inconsistent and incomplete field mapping, which then flowed into reporting and caused calculation differences in upstream measures. I addressed that by introducing a stronger mapping strategy to align the data into a unified structure before it was consumed by reporting and analytics.

My approach was to start with the business-critical domains first rather than trying to govern everything at once. I worked with stakeholders across finance, operations, payroll, and reporting teams to clarify which data entities needed common definitions, who should own them, and where quality controls had to be applied. From a delivery perspective, I introduced conformed structures in the reporting and analytics layer, aligned transformation rules across ETL and ELT processes, and established clearer metadata, lineage, and stewardship practices so the business could understand where data came from and how it was being used. At Abano, WhereScape RED was the primary warehouse automation platform, but it did not provide native MDM capability. Because of that, we built a practical custom MDM approach around governance, mapping standards, conformed models, reference data controls, and data quality checks. A formal data dictionary was initially absent, so I helped establish one, which improved shared understanding of core entities and strengthened the MDM discipline across the warehouse and reporting layers.

The improvement was practical and measurable in operational terms: better consistency in cross-domain reporting, reduced reconciliation effort between systems, and faster issue triage because ownership and lineage were clearer. What is relevant to DJ Homes is that I would apply the same staged MDM approach to core entities such as customer, property, supplier, project, and product data across systems like Timberline, ClickHome, Salesforce, and other operational platforms, with governance embedded into delivery rather than treated as separate theory exercise.

Once data is moved into the Bronze layer in Microsoft Fabric, I would use Microsoft Purview as the governance hub to catalogue data assets, define business terms, improve lineage visibility, and support stewardship across the priority master data domains.

For DJ Homes, one of the most vital steps for project success would be mapping data fields and establishing practical MDM across the core business flow of Salesforce (Lead) -> Constructive (Estimate) -> Framework (Project Ops) -> Timberline / BuilderMT (Financials) -> OnBase (Docs) -> ClickHome (Customer Portal). If those entities and hand-offs are not consistently defined and governed across systems, reporting quality, reconciliation, and user trust will all suffer.

## 2. Data Warehouse / Lakehouse Design & Delivery

The strongest example is my work across Attekus and Abano, where I was responsible for modernising fragmented analytics environments into more scalable and governed platforms. At Attekus, I led data platform strategy using Microsoft Fabric and implemented medallion architecture patterns. At Abano, I designed the target-state architecture to modernise two legacy data warehouses and create a more robust platform for enterprise reporting and analytics.

From a modelling perspective, I use a layered architecture because it supports both control and scale. Bronze handles raw ingestion and traceability, silver is where data is standardised, cleansed, and aligned to enterprise rules, and gold is where business-ready dimensional models are prepared for reporting and analytics consumption. I use conceptual, logical, and physical modelling depending on the audience and the design stage, and for reporting I favour dimensional structures with conformed dimensions because they support consistent executive and operational reporting.

To ensure scalability and performance, I separate ingestion and serving workloads, use incremental load patterns where appropriate, and design for maintainability rather than one-off pipelines. To ensure quality, I put validation rules between layers, control promotion into curated models, and align semantic models in Power BI to the governed data products.

This experience is transferable to DJ Homes because the business appears to operate across multiple distributed source systems with different structures, owners, and reporting needs. In that kind of environment, domain understanding and clear data definitions are essential to building user confidence in reporting accuracy. That is why I see this role as requiring a hands-on leader who can design and build a modern warehouse or lakehouse while keeping a full view of the current landscape and the future direction of the business.

## 3. ETL/ELT and Data Pipeline Engineering

I have designed and supported ETL and ELT pipelines in integration-heavy environments across healthcare, local government, and enterprise analytics platforms. A representative example is the architecture and delivery work I led at Abano, where multiple business domains and more than 250 endpoints had to be integrated into a coherent reporting and analytics capability. Another strong example is Whanau Tahi, where I led the migration of an 8 TB SQL Server environment to Azure with staged cutover and minimal downtime.

My engineering approach is to keep pipelines modular and operationally reliable. I typically separate extraction, schema alignment, business transformation, validation, and publish stages so each step is easier to test, monitor, and recover. I use SQL-based transformations heavily, align orchestration patterns to ADF or SSIS-style delivery where appropriate, and design restart-safe loads so reprocessing is controlled rather than manual. I also put monitoring around freshness, failures, and data quality exceptions, with clear runbook-style support processes for operational teams.

The result has been more reliable refresh cycles, better supportability, and lower risk during change or migration events. For DJ Homes, that matters because the data environment will need both batch and potentially near-real-time data flows across several operational systems, and the pipelines need to be scalable, traceable, and supportable from day one.

## 4. Data Integration Across Core Business Systems

The best example is Abano Healthcare Group, where I owned architecture direction for an enterprise environment with over 250 endpoints across finance, payroll, and operational systems. The challenge in that setting was not only technical integration, but also reducing duplication, improving supportability, and making sure reporting and analytics had a consistent foundation across disparate source systems.

My approach was to choose integration patterns based on business need rather than forcing one pattern everywhere. Where operational interaction required responsiveness, I supported API-led integration patterns. Where the use case was analytical consolidation, I used scheduled ETL and ELT patterns. In other environments, such as SimplHealth, I also worked with HL7-based real-time data flows, which reinforced the importance of handling different latency and data quality requirements properly. I standardised interface expectations, aligned source-specific data into reusable downstream structures, and made documentation and lineage part of the design process so integrations would be maintainable over time.

The outcome was a more coherent integration landscape and improved trust in downstream reporting. For DJ Homes, I would bring the same pattern-led approach to integrating systems such as Timberline, ClickHome, Salesforce, WMS or BuilderMT, OnBase, and other operational platforms, so the organisation is not left with brittle point-to-point fixes.

At DJ Homes, the core integration flow is likely to follow Salesforce (Lead) -> Constructive (Estimate) -> Framework (Project Ops) -> Timberline / BuilderMT (Financials) -> OnBase (Docs) -> ClickHome (Customer Portal), so the extraction and integration method should be selected based on each platform's operational role and technical capability.

| System                 | Recommended Extraction Method |
| ---------------------- | ----------------------------- |
| Salesforce             | API / CDC ingestion           |
| Constructive           | SQL incremental extraction    |
| Framework              | SQL or API ingestion          |
| Timberline / BuilderMT | SQL or staged exports         |
| OnBase                 | API metadata extraction       |
| ClickHome              | REST API ingestion            |

## 5. Development of an Enterprise Data Strategy

I have developed and delivered data strategy in environments where the organisation needed both a roadmap and hands-on execution. At Attekus, I led data platform, integration, and reporting architecture direction in a practical delivery environment. At Abano, I defined the target-state architecture and roadmap for platform modernisation, integration uplift, and reporting enablement across a large and complex enterprise footprint.

My approach is based on four pillars: governance, architecture, integration, and analytics value. I begin with a current-state assessment of systems, data quality risks, duplicated reporting logic, integration pain points, and capability gaps. From there I define the target state, sequence the roadmap by business value and delivery risk, and establish guardrails around standards, quality controls, ownership, and release discipline. I then socialise that strategy with executives and domain stakeholders in plain business language so there is visible alignment between technical investment and business outcomes.

The outcome of this approach has been clearer platform direction, better prioritisation, and practical modernisation rather than isolated technical fixes. I also pay close attention to cost and operating efficiency at design stage. For example, in Attekus and Abano I introduced platform optimisation approaches such as elastic pools and Azure reservation decisions that improved cost control while still supporting scalability and reliability. That is highly relevant to DJ Homes because this role is effectively the first data leadership hire, and success will depend on creating a roadmap the CIO and business leaders can trust while still delivering foundational capability quickly.

## 6. Power BI Enterprise Capability & Semantic Model Management

I have strong hands-on experience uplifting enterprise Power BI environments, particularly at Attekus and Abano. In both settings, the challenge was not simply report development; it was establishing a Power BI capability that could scale without creating duplicated logic, inconsistent definitions, or performance issues. I have also looked closely at the cost side of BI platform operations. For example, assigning Fabric capacity more appropriately to workspace workloads can often deliver the same reporting outcomes with better cost efficiency for the organisation.

My approach is to treat semantic models as enterprise assets. I implement modelling standards, reusable measures, naming conventions, and clearer workspace governance so reports are built on trusted shared datasets rather than disconnected report-level logic. I have worked directly on DAX optimisation, semantic model design, and deployment pipeline improvements, and I focus on reducing ambiguity in relationships, controlling promotion between environments, and separating governed enterprise reporting from ad hoc analysis.

Another important area has been security. Row-level security was a key requirement in both Attekus and Abano. At Abano, one effective approach was to manage access rules through a configurable security matrix stored within the data warehouse, which allowed row-level access behaviour to be maintained in a controlled and externally manageable way rather than hard-coded into multiple reports.

The benefit is improved report performance, stronger consistency across dashboards, safer self-service analytics, and tighter governance over security and release management. For DJ Homes, that means preserving the existing investment in Power BI while lifting governance, model quality, deployment discipline, and business trust in the reporting layer.

For DJ Homes, preparation of data in the Silver and Gold layers will have a significant impact on Power BI performance. Most of the heavy transformation, shaping, and business rule logic that is often pushed into DAX measures or Power Query should instead be handled upstream in the Bronze to Silver and Silver to Gold transformation layers in Fabric. That approach reduces model complexity, improves refresh efficiency, and produces a cleaner, more scalable semantic model for reporting.

## 7. Data Governance, Quality, and Metadata Management

My view is that governance only works when it is built into delivery processes. Across my architecture and platform roles, particularly at Abano and Attekus, I have established governance guardrails covering standards, metadata, lineage, and data quality controls, rather than treating governance as a document-only exercise.

Data quality was checked at multiple staging points during warehouse processing, with status monitoring and daily anomaly reporting to the relevant data owners for correction and follow-up. In practice, that means defining ownership by domain, making metadata and lineage visible through design and delivery artefacts, and embedding validation checks into ingestion and transformation pipelines. I have used Microsoft-aligned governance practices, including Purview-style metadata and lineage controls, and I have also used platforms such as WhereScape RED to support metadata visibility, lineage, and warehouse documentation. At Abano, because WhereScape RED did not include shipped MDM features, we supplemented it with custom governance and data dictionary practices to support consistent definitions and more reliable reporting outcomes.

I focus on practical quality measures such as validity, completeness, duplication, and exception handling because those are the controls the business feels directly. The outcome is better traceability, stronger compliance posture, and quicker resolution of data defects because teams know where the issue originated and who owns the fix. For DJ Homes, I would phase this work, starting with the highest-value data domains and most critical reports, then expanding governance coverage as the platform matures.

## 8. Leadership Capability and First 30/60/90 Days

My leadership style is hands-on, transparent, and delivery-focused. I am comfortable operating as an individual contributor while setting strategic direction, which is important in a first-hire role like this one. In a business with seven to nine core systems, I would be careful not to overpromise full enterprise integration in the first 90 days. A program of this scale cannot reasonably be fully built and completed in one quarter. In that timeframe, success should be measured by clarity, prioritisation, a tested prototype for the priority use case, and a production delivery plan the business can trust.

In the first 30 days, I would focus on structured discovery and stakeholder alignment. That would include understanding the current system landscape, critical data flows, reporting pain points, key reconciliation issues, and the highest-risk data quality gaps. I would meet with the CIO, IT Manager, and business stakeholders to confirm priority use cases, critical reports, and which source systems should be tackled first.

By 60 days, I would expect to have a current-state assessment completed, a target-state architecture defined, and a phased delivery roadmap agreed. I would also want the initial governance model in place, including data ownership for priority domains, integration design principles, and the first set of data quality controls. At that point, I would normally start building the foundation for a priority reporting use case rather than trying to onboard every source system at once.

By 90 days, I believe a realistic success measure would be a reasonably complete and tested prototype for the agreed priority data flow or reporting use case, supported by validated integration patterns, clearer ownership, and stronger Power BI and governance standards. In parallel, I would expect governance rhythms to be established, implementation risks to be better understood, and the production build plan for the next phases of system onboarding and model expansion to be clearly defined. For a multi-system environment like DJ Homes, that is a credible first-quarter outcome: not a finished enterprise platform, but a trusted prototype, an agreed path to production, and a roadmap the business can have confidence in.
