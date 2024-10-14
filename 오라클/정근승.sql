select * from product;
select * from bom;
select * from emp;
select * from authorities;
select * from board;
select * from posts;
select * from comments;
select * from replies;
delete from emp where name='test';
delete from authorities where authority='ROLE_USER';
alter table board add (likes number(1));
commit;
drop table replies;

CREATE TABLE replies (
    reply_id VARCHAR2(50) PRIMARY KEY,         -- ��� ���� ID
    comment_id VARCHAR2(50) NOT NULL,    -- ��� ID (�ܷ�Ű)
    user_id VARCHAR2(50) NOT NULL,       -- ����� ID
    content VARCHAR2(255) NOT NULL,     -- ��� ����
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- ���� ��¥
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- ���� ��¥
);

ALTER TABLE posts
MODIFY content VARCHAR2(4000);

alter table posts
modify created_at timestamp DEFAULT CURRENT_TIMESTAMP;

alter table posts
modify view_cnt number(4,0) DEFAULT 1;

ALTER TABLE replies
ADD CONSTRAINT fk_comment_reply
FOREIGN KEY (comment_id) REFERENCES comments(comment_id) ON DELETE CASCADE;

insert into replies (reply_id, comment_id, user_id, content) values ('R001', 'C004', 'geun', 'ù��° ����Դϴ�.');

delete from comments where comment_id = 'C009';
delete from replies where reply_id = '7';

SELECT r.reply_id, r.comment_id, r.content, r.user_id, e.name as reply_name, created_at, updated_at
FROM replies r
JOIN emp e ON r.user_id = e.user_id;

INSERT ALL
    INTO board (board_id, board_name, description, created_by, created_at) VALUES ('B001', '��������', 'ȸ�� ���������� �Խ��ϴ� ���Դϴ�.', 'geun', TO_DATE('2024-10-10', 'YYYY-MM-DD'))
    INTO board (board_id, board_name, description, created_by, created_at) VALUES ('B002', '�����Խ���', '����ڵ��� �����Ӱ� ���� �ۼ��ϴ� �Խ����Դϴ�.', 'geun', TO_DATE('2024-10-09', 'YYYY-MM-DD'))
    INTO board (board_id, board_name, description, created_by, created_at) VALUES ('B003', '������ �亯', '������ �亯�� �ְ�޴� �����Դϴ�.', 'geun', TO_DATE('2024-10-08', 'YYYY-MM-DD'))
    INTO board (board_id, board_name, description, created_by, created_at) VALUES ('B004', '�̺�Ʈ', 'ȸ�� �̺�Ʈ�� ���õ� �Խñ��� �Խ��ϴ� ���Դϴ�.', 'geun', TO_DATE('2024-10-07', 'YYYY-MM-DD'))
    INTO board (board_id, board_name, description, created_by, created_at) VALUES ('B005', 'ä�� ����', 'ä��� ���õ� ������ �Խ��ϴ� �Խ����Դϴ�.', 'geun', TO_DATE('2024-10-06', 'YYYY-MM-DD'))
SELECT 1 FROM dual;


SELECT 
        p.post_id,
        p.board_id,
        b.board_name, -- board ���̺��� board_name ��������
        p.title,
        p.content,
        p.author_id,
        e.name AS author_name, -- emp ���̺��� name ��������
        p.created_at,
        p.updated_at,
        p.pinned,
        p.view_cnt
    FROM posts p
    LEFT JOIN board b ON p.board_id = b.board_id -- board_name�� �������� ���� JOIN
    LEFT JOIN emp e ON p.author_id = e.user_id -- author_id�� �ش��ϴ� �̸��� �������� ���� JOIN
    WHERE p.post_id = 'P001';

SELECT c.comment_id, c.post_id, p.title AS post_title, e.name AS employee_name, c.content, c.created_at
FROM comments c
JOIN emp e ON c.employee_id = e.user_id
JOIN posts p ON c.post_id = p.post_id
WHERE c.post_id = 'P019';

SELECT *
FROM (
    SELECT p.*, rownum AS rnum
    FROM (
        SELECT p.post_id, p.board_id, b.board_name, p.title, p.content, p.author_id, e.name AS author_name, 
               p.created_at, p.updated_at, p.pinned, p.view_cnt
        FROM posts p
        LEFT JOIN board b ON p.board_id = b.board_id  
        LEFT JOIN emp e ON p.author_id = e.user_id  
        ORDER BY p.post_id -- ���ϴ� ���� ������ ���⿡ ����
    ) p
    WHERE rownum <= 10 -- �� �� ��ȣ ����
)
WHERE rnum >= 1; -- ���� �� ��ȣ ����




        
INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P001', 'B001', 'Title 1', 'Content 1', 'geun', SYSDATE, SYSDATE, 'N', 10);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P002', 'B002', 'Title 2', 'Content 2', 'geun', SYSDATE, SYSDATE, 'N', 20);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P003', 'B003', 'Title 3', 'Content 3', 'geun', SYSDATE, SYSDATE, 'Y', 30);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P004', 'B004', 'Title 4', 'Content 4', 'geun', SYSDATE, SYSDATE, 'N', 40);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P005', 'B005', 'Title 5', 'Content 5', 'geun', SYSDATE, SYSDATE, 'N', 50);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P006', 'B001', 'Title 6', 'Content 6', 'geun', SYSDATE, SYSDATE, 'Y', 15);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P007', 'B002', 'Title 7', 'Content 7', 'geun', SYSDATE, SYSDATE, 'N', 25);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P008', 'B003', 'Title 8', 'Content 8', 'geun', SYSDATE, SYSDATE, 'N', 35);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P009', 'B004', 'Title 9', 'Content 9', 'geun', SYSDATE, SYSDATE, 'N', 45);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P010', 'B005', 'Title 10', 'Content 10', 'geun', SYSDATE, SYSDATE, 'Y', 55);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P011', 'B001', 'Title 11', 'Content 11', 'geun', SYSDATE, SYSDATE, 'N', 65);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P012', 'B001', 'Title 12', 'Content 12', 'geun', SYSDATE, SYSDATE, 'N', 70);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P013', 'B002', 'Title 13', 'Content 13', 'geun', SYSDATE, SYSDATE, 'Y', 80);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P014', 'B003', 'Title 14', 'Content 14', 'geun', SYSDATE, SYSDATE, 'N', 90);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P015', 'B004', 'Title 15', 'Content 15', 'geun', SYSDATE, SYSDATE, 'N', 100);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P016', 'B005', 'Title 16', 'Content 16', 'geun', SYSDATE, SYSDATE, 'Y', 110);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P017', 'B001', 'Title 17', 'Content 17', 'geun', SYSDATE, SYSDATE, 'N', 120);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P018', 'B002', 'Title 18', 'Content 18', 'geun', SYSDATE, SYSDATE, 'N', 130);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P019', 'B003', 'Title 19', 'Content 19', 'geun', SYSDATE, SYSDATE, 'Y', 140);

INSERT INTO posts (post_id, board_id, title, content, author_id, created_at, updated_at, pinned, view_cnt)
VALUES ('P020', 'B004', 'Title 20', 'Content 20', 'geun', SYSDATE, SYSDATE, 'N', 150);



INSERT INTO comments (comment_id, post_id, employee_id, content, created_at)
VALUES ('C001', 'P019', 'geun', 'ù ��° ����Դϴ�.', TO_DATE('2024-10-10', 'YYYY-MM-DD'));

INSERT INTO comments (comment_id, post_id, employee_id, content, created_at)
VALUES ('C002', 'P019', 'geun', '�� ��° ����Դϴ�.', TO_DATE('2024-10-11', 'YYYY-MM-DD'));

INSERT INTO comments (comment_id, post_id, employee_id, content, created_at)
VALUES ('C003', 'P019', 'geun', '�� ��° ����Դϴ�.', TO_DATE('2024-10-12', 'YYYY-MM-DD'));

INSERT INTO comments (comment_id, post_id, employee_id, content, created_at)
VALUES ('C004', 'P019', 'geun', '�� ��° ����Դϴ�.', TO_DATE('2024-10-13', 'YYYY-MM-DD'));

INSERT INTO comments (comment_id, post_id, employee_id, content, created_at)
VALUES ('C005', 'P019', 'geun', '�ټ� ��° ����Դϴ�.', TO_DATE('2024-10-14', 'YYYY-MM-DD'));


