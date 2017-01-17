<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">


<mapper namespace="sample">

<select id="userSelect" parameterType="hashmap" resultType="hashmap">
		<![CDATA[
            SELECT
                email        
            FROM
                user
            WHERE
            	email = ${email}
        ]]>
    </select>
    
    <select id="userLogin" parameterType="hashmap" resultType="hashmap">
		<![CDATA[
            SELECT
                email,
                password   
            FROM
                user
            WHERE
            	  email = #{email} AND password = #{password}
        ]]>
    </select>
    
    <insert id="userInsert" parameterType="hashmap">
    <![CDATA[
        INSERT INTO TB_BOARD
        (            
            email,
            password,
            type
         
        )
        VALUES
        (
            
            #{email}, 
            #{password}, 
            #{type]
        )
    ]]>
	</insert>

</mapper>