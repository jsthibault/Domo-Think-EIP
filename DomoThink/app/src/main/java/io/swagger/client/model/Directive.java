package io.swagger.client.model;

import io.swagger.client.model.Periodicity;
import java.math.BigDecimal;

import io.swagger.annotations.*;
import com.google.gson.annotations.SerializedName;


@ApiModel(description = "")
public class Directive  {
  
  @SerializedName("id")
  private BigDecimal id = null;
  @SerializedName("name")
  private String name = null;
  @SerializedName("creatorId")
  private BigDecimal creatorId = null;
  @SerializedName("objectId")
  private BigDecimal objectId = null;
  @SerializedName("actionId")
  private BigDecimal actionId = null;
  @SerializedName("periodicity")
  private Periodicity periodicity = null;

  
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
  public BigDecimal getCreatorId() {
    return creatorId;
  }
  public void setCreatorId(BigDecimal creatorId) {
    this.creatorId = creatorId;
  }

  
  /**
   **/
  @ApiModelProperty(value = "")
  public BigDecimal getObjectId() {
    return objectId;
  }
  public void setObjectId(BigDecimal objectId) {
    this.objectId = objectId;
  }

  
  /**
   **/
  @ApiModelProperty(value = "")
  public BigDecimal getActionId() {
    return actionId;
  }
  public void setActionId(BigDecimal actionId) {
    this.actionId = actionId;
  }

  
  /**
   **/
  @ApiModelProperty(value = "")
  public Periodicity getPeriodicity() {
    return periodicity;
  }
  public void setPeriodicity(Periodicity periodicity) {
    this.periodicity = periodicity;
  }

  

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class Directive {\n");
    
    sb.append("  id: ").append(id).append("\n");
    sb.append("  name: ").append(name).append("\n");
    sb.append("  creatorId: ").append(creatorId).append("\n");
    sb.append("  objectId: ").append(objectId).append("\n");
    sb.append("  actionId: ").append(actionId).append("\n");
    sb.append("  periodicity: ").append(periodicity).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}
