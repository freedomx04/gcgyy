package com.hongmeng.gcgyy.entity.assist;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "assist_evaluate")
public class EvaluateEntity extends BaseEntity {
	
	private Integer acceptSpeed = 0;
	
	private Integer processSpeed = 0;
	
	private Integer result = 0;
			
	private String evaluation;
	
	public EvaluateEntity() {
		// TODO Auto-generated constructor stub
	}

	public EvaluateEntity(Integer acceptSpeed, Integer processSpeed, Integer result, String evaluation) {
		this.acceptSpeed = acceptSpeed;
		this.processSpeed = processSpeed;
		this.result = result;
		this.evaluation = evaluation;
	}

	public Integer getAcceptSpeed() {
		return acceptSpeed;
	}

	public void setAcceptSpeed(Integer acceptSpeed) {
		this.acceptSpeed = acceptSpeed;
	}

	public Integer getProcessSpeed() {
		return processSpeed;
	}

	public void setProcessSpeed(Integer processSpeed) {
		this.processSpeed = processSpeed;
	}

	public Integer getResult() {
		return result;
	}

	public void setResult(Integer result) {
		this.result = result;
	}

	public String getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}

}