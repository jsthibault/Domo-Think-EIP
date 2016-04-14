package io.swagger.client.model;

import java.math.BigDecimal;

import io.swagger.annotations.*;
import com.google.gson.annotations.SerializedName;


@ApiModel(description = "")
public class BoxInformations  {
  
  @SerializedName("id")
  private BigDecimal id = null;
  @SerializedName("name")
  private String name = null;
  @SerializedName("version")
  private String version = null;
  @SerializedName("ownerId")
  private BigDecimal ownerId = null;
  @SerializedName("data")
  private Object data = null;

  
  /**
   **/
  @ApiModelProperty(value = "")
  public BigDecimal getId() {
    return id;
  }
  public void setId(BigDecimal id) {
    this.id = id;
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
  public String getVersion() {
    return version;
  }
  public void setVersion(String version) {
    this.version = version;
  }

  
  /**
   **/
  @ApiModelProperty(value = "")
  public BigDecimal getOwnerId() {
    return ownerId;
  }
  public void setOwnerId(BigDecimal ownerId) {
    this.ownerId = ownerId;
  }

  
  /**
   **/
  @ApiModelProperty(value = "")
  public Object getData() {
    return data;
  }
  public void setData(Object data) {
    this.data = data;
  }

  

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class BoxInformations {\n");
    
    sb.append("  id: ").append(id).append("\n");
    sb.append("  name: ").append(name).append("\n");
    sb.append("  version: ").append(version).append("\n");
    sb.append("  ownerId: ").append(ownerId).append("\n");
    sb.append("  data: ").append(data).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}
