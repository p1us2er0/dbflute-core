/*
 * Copyright 2014-2017 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language
 * governing permissions and limitations under the License.
 */
package org.dbflute.infra.doc.decomment.parts;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author hakiba
 * @author cabos
 */
public class DfDecoMapColumnPart {

    // ===================================================================================
    //                                                                           Attribute
    //                                                                           =========
    protected String columnName;
    protected Map<String, DfDecoMapPropertyPart> propertyMap = new LinkedHashMap<>();

    // ===================================================================================
    //                                                                           Converter
    //                                                                           =========
    public DfDecoMapColumnPart() {
    }

    @SuppressWarnings("unchecked")
    public DfDecoMapColumnPart(Map<String, Object> columnPartMap) {
        this.columnName = (String) columnPartMap.get("columnName");
        List<Map<String, Object>> propertyMapList = (List<Map<String, Object>>) columnPartMap.get("propertyList");
        propertyMapList.stream().map(DfDecoMapPropertyPart::new).forEach(property -> {
            propertyMap.put(property.getPieceCode(), property);
        });
    }

    // done cabos convertToMap()? by jflute (2017/11/11)
    public Map<String, Object> convertToMap() {
        List<Map<String, Object>> propertyMapList = propertyMap.values().stream().map(DfDecoMapPropertyPart::convertToMap)
                .collect(Collectors.toList());
        Map<String, Object> map = new LinkedHashMap<>();
        map.put("columnName", columnName);
        map.put("propertyList", propertyMapList);
        return map;
    }

    // ===================================================================================
    //                                                                            Accessor
    //                                                                            ========
    public String getColumnName() {
        return this.columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public List<DfDecoMapPropertyPart> getPropertyList() {
        return new ArrayList<>(this.propertyMap.values());
    }

    public void addProperty(DfDecoMapPropertyPart property) {
        this.propertyMap.put(property.getPieceCode(), property);
    }

    public void removeProperty(String pieceCode) {
        if (pieceCode != null) {
            propertyMap.remove(pieceCode);
        }
    }
}
