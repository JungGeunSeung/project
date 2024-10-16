select * from product where product_id = 'MD106M1C';
select * from product;
select * from plan;

SELECT p.post_id, p.board_id, b.board_name, p.title, p.author_id, 
       e.name AS author_name, p.created_at
FROM (
    SELECT p.post_id, p.board_id, p.title, p.author_id, p.created_at
    FROM posts p
    ORDER BY p.created_at DESC
) p
LEFT JOIN board b ON p.board_id = b.board_id  
LEFT JOIN emp e ON p.author_id = e.user_id
WHERE ROWNUM <= 10
order by created_at desc;
