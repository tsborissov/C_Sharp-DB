	UPDATE Issues
		SET IssueStatus = 'closed'
WHERE AssigneeId = 6 AND IssueStatus != 'closed'

