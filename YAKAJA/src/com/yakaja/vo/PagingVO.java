package com.yakaja.vo;

public class PagingVO {

	

		private int pageSize; // 寃뚯떆 湲� �닔
		private int firstPageNo; // 泥� 踰덉㎏ �럹�씠吏� 踰덊샇
		private int prevPageNo; // �씠�쟾 �럹�씠吏� 踰덊샇
		private int startPageNo; // �떆�옉 �럹�씠吏� (�럹�씠吏� �꽕鍮� 湲곗�)
		private int pageNo; // �럹�씠吏� 踰덊샇
		private int endPageNo; // �걹 �럹�씠吏� (�럹�씠吏� �꽕鍮� 湲곗�)
		private int nextPageNo; // �떎�쓬 �럹�씠吏� 踰덊샇
		private int finalPageNo; // 留덉�留� �럹�씠吏� 踰덊샇
		private int totalCount; // 寃뚯떆 湲� �쟾泥� �닔

		public int getPageSize() {
			return pageSize;
		}

		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}

		public int getFirstPageNo() {
			return firstPageNo;
		}

		public void setFirstPageNo(int firstPageNo) {
			this.firstPageNo = firstPageNo;
		}

		public int getPrevPageNo() {
			return prevPageNo;
		}

		public void setPrevPageNo(int prevPageNo) {
			this.prevPageNo = prevPageNo;
		}

		public int getStartPageNo() {
			return startPageNo;
		}

		public void setStartPageNo(int startPageNo) {
			this.startPageNo = startPageNo;
		}

		public int getPageNo() {
			return pageNo;
		}

		public void setPageNo(int pageNo) {
			this.pageNo = pageNo;
		}

		public int getEndPageNo() {
			return endPageNo;
		}

		public void setEndPageNo(int endPageNo) {
			this.endPageNo = endPageNo;
		}

		public int getNextPageNo() {
			return nextPageNo;
		}

		public void setNextPageNo(int nextPageNo) {
			this.nextPageNo = nextPageNo;
		}

		public int getFinalPageNo() {
			return finalPageNo;
		}

		public void setFinalPageNo(int finalPageNo) {
			this.finalPageNo = finalPageNo;
		}

		public int getTotalCount() {
			return totalCount;
		}

		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
			this.makePaging();
		}
		
		
		public void makePaging() {
			if (this.totalCount == 0)
				return; // 寃뚯떆 湲� �쟾泥� �닔媛� �뾾�뒗 寃쎌슦
			if (this.pageNo == 0)
				this.setPageNo(1); // 湲곕낯 媛� �꽕�젙
			if (this.pageSize == 0)
				this.setPageSize(10); // 湲곕낯 媛� �꽕�젙

			int finalPage = (totalCount + (pageSize - 1)) / pageSize; // 留덉�留� �럹�씠吏�
			if (this.pageNo > finalPage)
				this.setPageNo(finalPage); // 湲곕낯 媛� �꽕�젙

			if (this.pageNo < 0 || this.pageNo > finalPage)
				this.pageNo = 1; // �쁽�옱 �럹�씠吏� �쑀�슚�꽦 泥댄겕

			boolean isNowFirst = pageNo == 1 ? true : false; // �떆�옉 �럹�씠吏� (�쟾泥�)
			boolean isNowFinal = pageNo == finalPage ? true : false; // 留덉�留� �럹�씠吏� (�쟾泥�)

			int startPage = ((pageNo - 1) / 10) * 10 + 1; // �떆�옉 �럹�씠吏� (�럹�씠吏� �꽕鍮� 湲곗�)
			int endPage = startPage + 10 - 1; // �걹 �럹�씠吏� (�럹�씠吏� �꽕鍮� 湲곗�)

			if (endPage > finalPage) { // [留덉�留� �럹�씠吏� (�럹�씠吏� �꽕鍮� 湲곗�) > 留덉�留� �럹�씠吏�] 蹂대떎 �겙 寃쎌슦
				endPage = finalPage;
			}

			this.setFirstPageNo(1); // 泥� 踰덉㎏ �럹�씠吏� 踰덊샇

			if (isNowFirst) {
				this.setPrevPageNo(1); // �씠�쟾 �럹�씠吏� 踰덊샇
			} else {
				this.setPrevPageNo(((pageNo - 1) < 1 ? 1 : (pageNo - 1))); // �씠�쟾 �럹�씠吏� 踰덊샇
			}

			this.setStartPageNo(startPage); // �떆�옉 �럹�씠吏� (�럹�씠吏� �꽕鍮� 湲곗�)
			this.setEndPageNo(endPage); // �걹 �럹�씠吏� (�럹�씠吏� �꽕鍮� 湲곗�)

			if (isNowFinal) {
				this.setNextPageNo(finalPage); // �떎�쓬 �럹�씠吏� 踰덊샇
			} else {
				this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo + 1))); // �떎�쓬 �럹�씠吏� 踰덊샇
			}

			this.setFinalPageNo(finalPage); // 留덉�留� �럹�씠吏� 踰덊샇
		}

	}
