package page;

public class PageManager_For_Lecture {

	private int requestPage;

	public PageManager_For_Lecture() {

	}

	public PageManager_For_Lecture(int requestPage) {

		this.requestPage = requestPage;
	}

	public PageRowResult getPageRowResult() {

		PageRowResult pageRowResult = new PageRowResult();

		// pageRowResult�� ��ü���� �� ����
		pageRowResult.setRowStartNumber(PageInfo_LectureList.ROW_COUNT_PRE_PAGE * (requestPage - 1) + 1);
		pageRowResult.setRowEndNumber(PageInfo_LectureList.ROW_COUNT_PRE_PAGE * requestPage);

		return pageRowResult;

	}

	public PageGroupResult getpageGroupResult(String sql) {

		PageGroupResult pageGroupResult = new PageGroupResult();

		// groupResult�� ��ü���� �� ����
		int requestPageGroupNumber = (requestPage - 1) / PageInfo_LectureList.SHOW_PAGE_COUNT;

		pageGroupResult.setGroupStartNumber(requestPageGroupNumber * PageInfo_LectureList.SHOW_PAGE_COUNT + 1);
		pageGroupResult.setGroupEndNumber((requestPageGroupNumber + 1) * PageInfo_LectureList.SHOW_PAGE_COUNT);

		// ���ټ� ��������
		PageDAO dao = new PageDAOImpl();
		int totalRow = dao.getCount(sql);

		// �� ��ũ ����
		int totalPageNumber = (totalRow - 1) / PageInfo_LectureList.ROW_COUNT_PRE_PAGE + 1;

		// last ������ ��ũ�� �����ϱ�
		if (pageGroupResult.getGroupEndNumber() > totalPageNumber) {
			pageGroupResult.setGroupEndNumber(totalPageNumber);
		}

		// before,after ����
		if (pageGroupResult.getGroupStartNumber() == 1) {

			pageGroupResult.setBeforePage(false);
		}

		if (pageGroupResult.getGroupEndNumber() == totalPageNumber) {

			pageGroupResult.setAfterPage(false);
		}

		pageGroupResult.setSelectPageNumber(requestPage);

		return pageGroupResult;
	}

}
