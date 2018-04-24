package com.jldata.smartframe.auth;

import com.jldata.smartframe.base.TestRestBussinessBase;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.hamcrest.Matchers;
import org.junit.Test;

import java.io.IOException;

public class TestHiController extends TestRestBussinessBase {

    @Test
    public void testhi() throws IOException {

        Response r = RestAssured.given(this.spec).contentType("application/json").header(TOKEN,this.token)
                .post(""+PRE_PATH+"/hi");
        r.then().statusCode(200).body("errcode", Matchers.equalTo(200));
        r.prettyPrint();
      /*  Response r = RestAssured.given(this.spec).contentType("application/json").body(objectMapper.writeValueAsString(param))
                .post(""+PRE_PATH+"/table/list");
        r.then().statusCode(200);
        r.prettyPrint();*/
    }

}
