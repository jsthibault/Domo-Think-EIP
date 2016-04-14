package io.swagger.client.model;

import java.math.BigDecimal;

import io.swagger.annotations.*;
import com.google.gson.annotations.SerializedName;


@ApiModel(description = "")
public class Periodicity  {
  
  @SerializedName("type")
  private BigDecimal type = null;
  @SerializedName("name")
  private String name = null;
  @SerializedName("data")
  private String data = null;

  
  /**
   **/
  @ApiModelProperty(value = "")
  public BigDecimal getType() {
    return type;
  }
  public void setType(BigDecimal type) {
    this.type = type;
  }

  
  /**
   **/
  @ApiModelProperty(required = true, value = "")
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }

  
  /**
   **/
  @ApiModelProperty(value = "")
  public String getData() {
    return data;
  }
  public void setData(String data) {
    this.data = data;
  }

  

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class Periodicity {\n");
    
    sb.append("  type: ").append(type).append("\n");
    sb.append("  name: ").append(name).append("\n");
    sb.append("  data: ").append(data).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}
