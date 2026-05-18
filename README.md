# HCMC-LLM-Project

LLM과 RAG를 활용하여 자동차 개발 연구자가 자동차 법규 문서를 더 효율적으로 검색하고 이해할 수 있도록 돕는 법률 문서 분석 챗봇 프로젝트입니다.

---

## 1. Purpose

본 프로젝트의 목적은 자동차 개발 연구자를 위한 법률 특화 LLM 모델 및 RAG 시스템을 구축하는 것입니다.

자동차 개발 과정에서는 관련 법규를 확인하고 해석해야 하는 경우가 많으며, 특히 자동차 규제는 지속적으로 변화하기 때문에 연구자가 모든 문서를 수작업으로 검토하는 데 많은 시간이 소요됩니다.

따라서 본 프로젝트는 다음과 같은 문제를 해결하는 것을 목표로 했습니다.

- 자동차 개발 과정에서 발생하는 법규 검토 업무의 비효율 개선
- 빠르게 변화하는 자동차 관련 규제에 대한 대응 지원
- 긴 법률 문서를 구조화하여 검색 가능한 형태로 변환
- 사용자의 질문에 대해 관련 법규 문맥을 검색하고 LLM 기반 답변 생성
- 자동차 개발 연구자가 필요한 법규 정보를 더 빠르게 확인할 수 있도록 지원

---

## 2. Teammate

| Name | Student ID | GitHub URL |
|---|---:|---|
| Park Sang Beom | 21800272 | [https://github.com/youfred/bcd-team-project](https://github.com/youfred/bcd-team-project) |
| Moon Byeo Ri | 22000245 | [https://github.com/ssidnwm/bcd-team-project1](https://github.com/ssidnwm/bcd-team-project1) |
| Kim Se Hee | 21900121 | [https://github.com/sese7414/bcd-team-project.git](https://github.com/sese7414/bcd-team-project.git) |
| Seong Gyu Ahn | 21800418 | [https://github.com/Chic-Chac/bcd-team-project.git](https://github.com/Chic-Chac/bcd-team-project.git) |

---

## 3. Data

본 프로젝트에서는 자동차 제동 관련 법규 문서를 주요 데이터로 사용했습니다.

사용 데이터는 다음과 같습니다.

- UN ECE Regulation Rel.78
- UN ECE Regulation Rel.139
- UN ECE Regulation Rel.150

해당 문서들은 Motor Vehicle Braking Laws, 즉 자동차 제동 관련 법규를 다루고 있으며, 자동차 개발 및 검증 과정에서 참고해야 하는 기술·법률 문서입니다.

---

## 4. Data Preprocessing

원본 데이터는 PDF 파일 형태로 제공되었으며, RAG 시스템에서 활용하기 위해 구조화된 데이터로 변환했습니다.

### Preprocessing Flow

```text
PDF File
→ Reading with Markdown
→ Text Cleaning
→ Change to JSON
→ Change to JSONL
→ Chunking
→ Vector Database
```

### 주요 전처리 작업

- PDF 법규 문서에서 텍스트 추출
- Markdown 형식으로 문서 구조 파악
- 불필요한 줄바꿈, 특수문자, 포맷 노이즈 정리
- 법규 문서의 본문 및 테이블 데이터 구조화
- 비정형 데이터와 테이블 데이터를 JSON/JSONL 형식으로 변환
- RAG 검색에 활용할 수 있도록 문서를 chunk 단위로 분할
- Vector DB에 저장 가능한 형태로 데이터 준비

---

## 5. RAG Systems

본 프로젝트는 Retrieval-Augmented Generation, 즉 RAG 구조를 기반으로 합니다.

LLM이 자체 지식만으로 답변하지 않고, 먼저 사용자의 질문과 관련 있는 법규 문서를 검색한 뒤 검색된 문맥을 기반으로 답변을 생성하도록 설계했습니다.

### RAG Workflow

```text
User Question
→ Query Processing
→ Vector Similarity Search
→ Retrieve Relevant Regulation Chunks
→ Prompt Construction
→ LLM Answer Generation
→ Final Answer
```

### RAG 시스템 구성 요소

| Component | Description |
|---|---|
| Document Loader | 전처리된 법규 문서를 로드 |
| Text Splitter | 긴 법률 문서를 검색 가능한 chunk 단위로 분할 |
| Embedding Model | 텍스트 데이터를 벡터로 변환 |
| Vector Database | 임베딩된 문서를 저장하고 유사도 기반 검색 수행 |
| Retriever | 사용자 질문과 관련된 법규 chunk 검색 |
| LLM | 검색된 문맥을 기반으로 답변 생성 |
| Streamlit UI | 사용자가 질문하고 답변을 확인할 수 있는 챗봇 인터페이스 제공 |

---

## 6. Repository Structure

```text
HCMC-LLM-Project/
├── app/
│   ├── rag_streamlit.py        # Main Streamlit RAG chatbot app
│   ├── carbotapp.py            # Agent-style RAG application
│   ├── creationchatbot.py      # Earlier chatbot implementation
│   ├── PCJsonApp.py            # JSON-based Streamlit app
│   └── pc_agentRag.py          # Agent RAG workflow implementation
│
├── src/
│   ├── database/
│   │   ├── createDB.py         # Vector DB creation script
│   │   └── createDB_chroma.py  # Chroma DB creation script
│   └── legacy/                 # Additional experimental scripts
│
├── data/
│   └── processed/              # Processed JSON/JSONL regulation data
│
├── data_processing/            # PDF/DOCX extraction, formatting, chunking notebooks
├── images/                     # UI/logo assets
├── recall/                     # Recall-related data and analysis files
├── docs/
│   └── presentation.pptx       # Project presentation file
│
├── requirements.txt
├── .env.example
├── .gitignore
└── README.md
```

---

## 7. Main Features

### 1. 자동차 법규 기반 질의응답

사용자가 자동차 제동 관련 법규에 대해 질문하면, 시스템이 관련 법규 문서를 검색한 뒤 답변을 생성합니다.

### 2. 의미 기반 검색

사용자 질문이 법규 문서의 표현과 정확히 일치하지 않더라도, 의미적으로 관련 있는 조항을 검색할 수 있도록 벡터 검색을 활용했습니다.

### 3. 구조화된 법규 데이터 처리

PDF 기반 법률 문서를 Markdown, JSON, JSONL 형식으로 변환하여 RAG 시스템에서 활용할 수 있도록 구성했습니다.

### 4. RAG / Agent Workflow 실험

기본 RAG 구조뿐 아니라 검색, 평가, 질문 재작성, 답변 생성을 포함하는 Agent 스타일 워크플로우도 실험했습니다.

---

## 8. My Role

팀원으로서 LLM/RAG 기반 자동차 법규 문서 분석 시스템의 데이터 전처리, 평가 지표 설계, 워크플로우 구성에 참여했습니다.

주요 기여 내용은 다음과 같습니다.

- 비정형 법규 문서 및 테이블 데이터 전처리 과정 참여
- 테이블 데이터를 분석 가능한 JSONL 형식으로 변환하는 작업 수행
- PDF 기반 법규 문서를 Markdown 및 JSON 형식으로 변환하는 과정 참여
- RAG 시스템의 chunking 전략 논의에 참여
- 검색 결과와 답변 품질을 확인하기 위한 평가 지표 설계 참여
- 검색, 평가, 질문 재작성, 답변 생성으로 이어지는 RAG/Agent 워크플로우 구성 참여
- 프로젝트 발표자료 및 문서화 작업 참여
- GitHub 제출을 위한 프로젝트 파일 구조 정리

---

## 9. Tech Stack

### Language

- Python

### LLM / RAG

- OpenAI API
- LangChain
- Retrieval-Augmented Generation
- Prompt Engineering

### Vector Search

- FAISS
- ChromaDB
- Embedding Models

### Data Processing

- JSON
- JSONL
- Markdown
- PDF Text Extraction
- Text Chunking
- Pandas

### UI

- Streamlit

---

## 10. Installation

```bash
git clone https://github.com/youfred/HCMC-LLM-Project.git
cd HCMC-LLM-Project
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

`.env.example` 파일을 참고하여 `.env` 파일을 생성한 뒤 API Key를 입력합니다.

```bash
cp .env.example .env
```

```text
OPENAI_API_KEY=YOUR_OPENAI_API_KEY
```

---

## 11. How to Run

### Main Streamlit RAG App

```bash
streamlit run app/rag_streamlit.py
```

### Agent-style RAG App

```bash
streamlit run app/carbotapp.py
```

### Other Experimental Apps

```bash
streamlit run app/creationchatbot.py
streamlit run app/PCJsonApp.py
streamlit run app/pc_agentRag.py
```

일부 스크립트는 실행 환경에 따라 로컬 Vector DB 파일 또는 경로 수정이 필요할 수 있습니다.

---

## 12. Project Outcome

본 프로젝트는 자동차 법규와 같은 특정 도메인의 법률·기술 문서에 LLM/RAG 구조를 적용한 사례입니다.

문서 전처리부터 JSON/JSONL 변환, 벡터 검색, LLM 기반 질의응답까지 이어지는 전체 흐름을 구현하며 다음과 같은 경험을 쌓았습니다.

- 비정형 법률 문서 및 테이블 데이터 처리
- PDF 문서를 Markdown 및 JSON/JSONL 형식으로 변환
- 도메인 특화 RAG 시스템 구조 이해
- 벡터 검색 기반 문서 검색 흐름 설계
- 검색 결과 및 답변 품질 평가 방식 설계
- 팀 기반 AI 프로젝트 수행 경험
- 90 % 이상의 답변 정확도 달성
