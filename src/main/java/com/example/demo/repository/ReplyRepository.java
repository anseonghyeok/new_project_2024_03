package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Article;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;

@Mapper
public interface ReplyRepository {

	@Select("""
				SELECT R.*, M.nickname AS extra__writer
				FROM reply AS R
				INNER JOIN `member` AS M
				ON R.memberId = M.id
				WHERE relTypeCode = #{relTypeCode}
				AND relId = #{relId}
				ORDER BY R.id ASC;
			""")
	List<Reply> getForPrintReplies(int loginedMemberId, String relTypeCode, int relId);

	@Insert("""
				INSERT INTO reply
				SET regDate = NOW(),
				updateDate = NOW(),
				memberId = #{loginedMemberId},
				relTypeCode = #{relTypeCode},
				relId = #{relId},
				`body` = #{body}
			""")
	void writeReply(int loginedMemberId, String relTypeCode, int relId, String body);

	@Insert("""
				DELETE FROM reply 	WHERE id = #{id}

			""")
	void deleteReply(int id);

	@Select("""
			SELECT *
			FROM reply
			WHERE id = #{id}
			""")
	Reply getForPrintReplie(int id);

	@Select("""
			<script>
				SELECT R.*, M.nickname AS extra__writer
				FROM reply AS R
				INNER JOIN `member` AS M
				ON R.memberId = M.id
				WHERE R.id = #{id}
				GROUP BY R.id
			</script>
				""")
	public Reply getForPrintReply(int id);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Update("""
			UPDATE reply
				<set>
					<if test="body != null and body != ''">`body` = #{body},</if>
					updateDate = NOW()
				</set>
			WHERE id = #{id}
				""")

	public void modifyReply(int id, String body);

}